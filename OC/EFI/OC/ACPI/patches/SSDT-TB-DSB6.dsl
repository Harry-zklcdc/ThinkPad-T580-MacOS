/*  
 * Partition and continuation of Thunderbolt 3 patch.
 * Depends on other TB-DSB* patches as well as /patches/OpenCore Patches/ Thunderbolt3.plist
 *
 * Credits @benbender
 */

DefinitionBlock ("", "SSDT", 2, "tyler", "_TBDSB6", 0x00001000)
{
    // Common utils from SSDT-Darwin.dsl
    External (DTGP, MethodObj) // 5 Arguments
    External (OSDW, MethodObj) // 0 Arguments

    External (_SB.PCI0.RP09.PXSX, DeviceObj)
    External (TBSE, IntObj)
    External (TBTS, IntObj)


    If (((TBTS == One) && (TBSE == 0x09)))
    {
        Scope (\_SB.PCI0.RP09.PXSX)
        {
            Device (DSB6)
            {
                Name (_ADR, 0x00060000)  // _ADR: Address

                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                Field (A1E0, ByteAcc, NoLock, Preserve)
                {
                    AVND,   32, 
                    BMIE,   3, 
                    Offset (0x18), 
                    PRIB,   8, 
                    SECB,   8, 
                    SUBB,   8, 
                    Offset (0x1E), 
                        ,   13, 
                    MABT,   1
                }

                OperationRegion (A1E1, PCI_Config, 0xC0, 0x40)
                Field (A1E1, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x01), 
                    Offset (0x02), 
                    Offset (0x04), 
                    Offset (0x08), 
                    Offset (0x0A), 
                        ,   5, 
                    TPEN,   1, 
                    Offset (0x0C), 
                    SSPD,   4, 
                        ,   16, 
                    LACR,   1, 
                    Offset (0x10), 
                        ,   4, 
                    LDIS,   1, 
                    LRTN,   1, 
                    Offset (0x12), 
                    CSPD,   4, 
                    CWDT,   6, 
                        ,   1, 
                    LTRN,   1, 
                        ,   1, 
                    LACT,   1, 
                    Offset (0x14), 
                    Offset (0x30), 
                    TSPD,   4
                }

                OperationRegion (A1E2, PCI_Config, 0x80, 0x08)
                Field (A1E2, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x01), 
                    Offset (0x02), 
                    Offset (0x04), 
                    PSTA,   2
                }

                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                {
                    Return (SECB) /* \_SB_.PCI0.RP09.UPSB.DSB6.SECB */
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (OSDW ())
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }

                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                {
                    Return (Zero)
                }
            }
        }
    }
}