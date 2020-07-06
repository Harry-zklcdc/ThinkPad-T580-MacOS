//
#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "SLEEP-A", 0)
{
#endif
    External(_SB.PCI0.LPCB.EC, DeviceObj)
    External(_SB.LID, DeviceObj)
    External(LID, DeviceObj)
    External(_SB.SLPB, DeviceObj)
    External(SLPB, DeviceObj)
    External(_SB.PCI0.LPCB.EC.XQ2A, MethodObj)
    External(_SB.PCI0.LPCB.EC.XQ2B, MethodObj)
    External(_SB.PCI0.LPCB.EC.XQ13, MethodObj)
    External(_SB.LID.XLID, MethodObj)

    Device(S2EP)
    {
        Name(_ADR, 0)
        Name(MYLD, 1)
        Name(MPWS, 0)
        Name(MODE, 1)         //0:PNP0C0D,1:PNP0C0E
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            MYLD = 1
            MPWS = 0
        }
    }
    
    Scope (_SB.LID)
    {
        Method (_LID, 0, NotSerialized)
        {
            if(\S2EP.MYLD==0)
             {
                 Return (0)
             }
             Else
             {
                 Return (\_SB.LID.XLID())
             }
        }
    }

    Scope (_SB.PCI0.LPCB.EC)
    {
        Method (_Q13, 0, NotSerialized)
        {
           If (_OSI ("Darwin"))
           {		
             	If (\S2EP.MODE==0)
             	{
                 	If (\S2EP.MYLD!=0)
                 	{
                     	\S2EP.MYLD =0
                 	}
                 	Else
                 	{
                     	\S2EP.MYLD =1
                 	}
                 	Notify (\_SB.LID, 0x80)
             	}
             	Else
             	{
                 	\S2EP.MPWS =1
                 	Notify (\_SB.SLPB, 0x80)
             	}  
            }  
            Else
            {
             	\_SB.PCI0.LPCB.EC.XQ13()
            } 
         }        
        
         Method (_Q2A, 0, NotSerialized)
         {
           If (_OSI ("Darwin"))
           {		
             If (\S2EP.MODE==0)
             {
                 \S2EP.MYLD =1
                 \_SB.PCI0.LPCB.EC.XQ2A()
             }
             Else
             {
                 \S2EP.MPWS =1
                 Notify (\_SB.SLPB, 0x80)
             }
           }
           Else
            {
             	\_SB.PCI0.LPCB.EC.XQ2A()
            } 
         }
     
         Method (_Q2B, 0, NotSerialized)
         {
           If (_OSI ("Darwin"))
           {		
             If (\S2EP.MODE==0)
             {
                 \S2EP.MYLD =1
                 \_SB.PCI0.LPCB.EC.XQ2B()
             }
             Else
             {
                 \S2EP.MPWS =1
                 Notify (\_SB.SLPB, 0x80)
             }
           }
           Else
            {
             	\_SB.PCI0.LPCB.EC.XQ2B()
            } 
         }
    }      
#ifndef NO_DEFINITIONBLOCK
}
#endif enable
//EOF