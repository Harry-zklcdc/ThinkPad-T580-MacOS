Device (MCHC)
{
	Name (_ADR, 0x00000000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Xeon E3-1200 v6/7th Gen Core Processor Host Bridge/DRAM Registers" },
			"device_type", Buffer () { "Bridge" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (IGPU)
{
	Name (_ADR, 0x00020000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"framebuffer-unifiedmem", Buffer () { 0x00, 0x00, 0x00, 0x80 },
			"framebuffer-con2-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
			"framebuffer-con2-pipe", Buffer () { 0x12, 0x00, 0x00, 0x00 },
			"device-id", Buffer () { 0x16, 0x59, 0x00, 0x00 },
			"framebuffer-con1-pipe", Buffer () { 0x12, 0x00, 0x00, 0x00 },
			"device_type", Buffer () { "Display controller" },
			"framebuffer-patch-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
			"enable-hdmi20", Buffer () { 0x01, 0x00, 0x00, 0x00 },
			"framebuffer-con0-pipe", Buffer () { 0x12, 0x00, 0x00, 0x00 },
			"AAPL,slot-name", Buffer () { "Internal" },
			"AAPL,ig-platform-id", Buffer () { 0x00, 0x00, 0x16, 0x59 },
			"model", Buffer () { "HD Graphics 620" },
			"framebuffer-con1-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
			"framebuffer-con0-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
		})
	}
}
Device (B0D4)
{
	Name (_ADR, 0x00040000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem" },
			"device_type", Buffer () { "Signal processing controller" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (pci8086,1911)
{
	Name (_ADR, 0x00080000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th Gen Core Processor Gaussian Mixture Model" },
			"device_type", Buffer () { "Generic system peripheral" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (XHC)
{
	Name (_ADR, 0x00140000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Sunrise Point-LP USB 3.0 xHCI Controller" },
			"device_type", Buffer () { "Serial bus controller" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (pci8086,9d31)
{
	Name (_ADR, 0x00140002)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Sunrise Point-LP Thermal subsystem" },
			"device_type", Buffer () { "Signal processing controller" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (IMEI)
{
	Name (_ADR, 0x00160000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Sunrise Point-LP CSME HECI #1" },
			"device_type", Buffer () { "Communication controller" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (SAT0)
{
	Name (_ADR, 0x00170000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Sunrise Point-LP SATA Controller [AHCI mode]" },
			"device_type", Buffer () { "Mass storage controller" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (RP05)
{
	Name (_ADR, 0x001c0004)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Sunrise Point-LP PCI Express Root Port #5" },
			"device_type", Buffer () { "Bridge" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (RP01)
{
	Name (_ADR, 0x001c0000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "JHL6240 Thunderbolt 3 Bridge (Low Power) [Alpine Ridge LP 2016]" },
			"device_type", Buffer () { "Bridge" },
			"AAPL,slot-name", Buffer () { "Internal@6,2,0" },
		})
	}
}
Device (RP07)
{
	Name (_ADR, 0x001c0006)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Sunrise Point-LP PCI Express Root Port #7" },
			"device_type", Buffer () { "Bridge" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (RP09)
{
	Name (_ADR, 0x001d0000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Sunrise Point-LP PCI Express Root Port #9" },
			"device_type", Buffer () { "Bridge" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (LPCB)
{
	Name (_ADR, 0x001f0000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Wildcat Point-LP LPC Controller" },
			"device_type", Buffer () { "Bridge" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (PPMC)
{
	Name (_ADR, 0x001f0002)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Sunrise Point-LP PMC" },
			"device_type", Buffer () { "Memory controller" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (HDEF)
{
	Name (_ADR, 0x001f0003)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Sunrise Point-LP HD Audio" },
			"layout-id", Buffer () { 0x00, 0x00, 0x00, 0x00 },
			"hda-gfx", Buffer () { "onboard-1" },
			"AAPL,slot-name", Buffer () { "Internal" },
			"device_type", Buffer () { "Multimedia controller" },
		})
	}
}
Device (SBUS)
{
	Name (_ADR, 0x001f0004)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Sunrise Point-LP SMBus" },
			"device_type", Buffer () { "Serial bus controller" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (GLAN)
{
	Name (_ADR, 0x001f0006)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Ethernet Connection (4) I219-V" },
			"device_type", Buffer () { "Network controller" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (RP09.UPSB)
{
	Name (_ADR, 0x00000000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "JHL6240 Thunderbolt 3 Bridge (Low Power) [Alpine Ridge LP 2016]" },
			"device_type", Buffer () { "Bridge" },
			"AAPL,slot-name", Buffer () { "Internal@6,2,0" },
		})
	}
}
Device (RP05.PXSX)
{
	Name (_ADR, 0x00000000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Intel 10 Series Chipset" },
			"device_type", Buffer () { "Mass storage controller" },
			"AAPL,slot-name", Buffer () { "Internal@3,0,0" },
		})
	}
}
Device (RP07.PXSX)
{
	Name (_ADR, 0x00000000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "BCM43602 802.11ac Wireless LAN SoC" },
			"device_type", Buffer () { "Network controller" },
			"AAPL,slot-name", Buffer () { "Internal@4,0,0" },
		})
	}
}
Device (UPSB.DSB0)
{
	Name (_ADR, 0x00000000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "JHL6240 Thunderbolt 3 Bridge (Low Power) [Alpine Ridge LP 2016]" },
			"device_type", Buffer () { "Bridge" },
			"AAPL,slot-name", Buffer () { "Internal@6,2,0" },
		})
	}
}
Device (UPSB.DSB1)
{
	Name (_ADR, 0x00010000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "JHL6240 Thunderbolt 3 Bridge (Low Power) [Alpine Ridge LP 2016]" },
			"device_type", Buffer () { "Bridge" },
			"AAPL,slot-name", Buffer () { "Internal@6,2,0" },
		})
	}
}
Device (UPSB.DSB2)
{
	Name (_ADR, 0x00020000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "JHL6240 Thunderbolt 3 Bridge (Low Power) [Alpine Ridge LP 2016]" },
			"device_type", Buffer () { "Bridge" },
			"AAPL,slot-name", Buffer () { "Internal@6,2,0" },
		})
	}
}
Device (DSB0.NHI0)
{
	Name (_ADR, 0x00000000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "JHL6240 Thunderbolt 3 NHI (Low Power) [Alpine Ridge LP 2016]" },
			"device_type", Buffer () { "Generic system peripheral" },
			"AAPL,slot-name", Buffer () { "Internal@8,0,0" },
		})
	}
}
Device (DSB2.XHC2)
{
	Name (_ADR, 0x00000000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Type C Gen2" },
			"device_type", Buffer () { "Serial bus controller" },
			"AAPL,slot-name", Buffer () { "Internal@7,0,0" },
		})
	}
}
