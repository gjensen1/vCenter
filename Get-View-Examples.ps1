
#PowerCLI commands for retrieving HOST information

 
#Get-View for specific VMHost
$vmhost = Get-view -viewtype HostSystem -filter @{"Name"="itspajweesx002.cihs.gov.on.ca"}


$vmhost.summary

<#Host               : HostSystem-host-2043
Hardware           : VMware.Vim.HostHardwareSummary
Runtime            : VMware.Vim.HostRuntimeInfo
Config             : VMware.Vim.HostConfigSummary
QuickStats         : VMware.Vim.HostListSummaryQuickStats
OverallStatus      : green
RebootRequired     : False
CustomValue        : {3, 4, 5, 6...}
ManagementServerIp : 10.200.3.149
MaxEVCModeKey      : intel-sandybridge
CurrentEVCModeKey  :
Gateway            :
LinkedView         :
#>

#Get the Annotations from $vmhost
$vmhost.Summary.CustomValue
<#
Value                                                  Key
-----                                                  ---
142.106.160.118                                          3
142.106.160.126                                          4
Sanders, Christina (MOECC)                               5
Paula Hargraves                                          6
CI0000000973868                                          7
6.0.0, 7504637                                           9
2M24063CJ3                                              11
EFSS - File Print                                       12
GTA                                                     14
2.40 - iLO 4                                            22
RFC 159915                                              23
HP ProLiant ML350p G8                                   25
230 Westney, Ajax                                       26
AJAXONIWN01-OPS00LP02 port: MAN10-AGG11- iLO12 - UPS15  27
N/A                                                     28
142.106.160.122                                         31
9938FLCPS719900335                                      32
08/03/2016 - DY                                        301
142.106.160.121                                        302
Yes                                                    501
#>

$vmhost.hardware

<#
SystemInfo             : VMware.Vim.HostSystemInfo
CpuPowerManagementInfo : VMware.Vim.HostCpuPowerManagementInfo
CpuInfo                : VMware.Vim.HostCpuInfo
CpuPkg                 : {0 1 2 3 4 5 6 7 8 9 10 11}
MemorySize             : 17143382016
NumaInfo               : VMware.Vim.HostNumaInfo
SmcPresent             : False
PciDevice              : {0000:00:00.0, 0000:00:01.0, 0000:00:01.1, 0000:00:02.0...}
CpuFeature             : {VMware.Vim.HostCpuIdInfo, VMware.Vim.HostCpuIdInfo, VMware.Vim.HostCpuIdInfo, VMware.Vim.HostCpuIdInfo...}
BiosInfo               : VMware.Vim.HostBIOSInfo
ReliableMemoryInfo     :
#>

$vmhost.hardware.biosinfo
<#
BiosVersion ReleaseDate
----------- -----------
P72         2015-07-01 12:00:00 AM
#>

$vmhost.config
<#
Host                      : HostSystem-host-2043
Product                   : VMware.Vim.AboutInfo
HyperThread               : VMware.Vim.HostHyperThreadScheduleInfo
ConsoleReservation        :
VirtualMachineReservation :
StorageDevice             : VMware.Vim.HostStorageDeviceInfo
MultipathState            : VMware.Vim.HostMultipathStateInfo
FileSystemVolume          : VMware.Vim.HostFileSystemVolumeInfo
SystemFile                :
Network                   : VMware.Vim.HostNetworkInfo
Vmotion                   : VMware.Vim.HostVMotionInfo
VirtualNicManagerInfo     : VMware.Vim.HostVirtualNicManagerInfo
Capabilities              : VMware.Vim.HostNetCapabilities
DatastoreCapabilities     : VMware.Vim.HostDatastoreSystemCapabilities
OffloadCapabilities       : VMware.Vim.HostNetOffloadCapabilities
Service                   : VMware.Vim.HostServiceInfo
Firewall                  : VMware.Vim.HostFirewallInfo
AutoStart                 : VMware.Vim.HostAutoStartManagerConfig
ActiveDiagnosticPartition : VMware.Vim.HostDiagnosticPartition
Option                    : {BufferCache.FlushInterval, BufferCache.HardMaxDirty, BufferCache.PerFileHardMaxDirty, BufferCache.SoftMaxDirty...}
OptionDef                 : {BufferCache.FlushInterval, BufferCache.HardMaxDirty, BufferCache.PerFileHardMaxDirty, BufferCache.SoftMaxDirty...}
DatastorePrincipal        : root
LocalSwapDatastore        :
SystemSwapConfiguration   : VMware.Vim.HostSystemSwapConfiguration
SystemResources           : VMware.Vim.HostSystemResourceInfo
DateTimeInfo              : VMware.Vim.HostDateTimeInfo
Flags                     : VMware.Vim.HostFlagInfo
AdminDisabled             : False
LockdownMode              : lockdownDisabled
Ipmi                      :
SslThumbprintInfo         :
SslThumbprintData         :
Certificate               : {45, 45, 45, 45...}
PciPassthruInfo           : {0000:00:00.0, 0000:00:01.0, 0000:00:01.1, 0000:00:02.0...}
AuthenticationManagerInfo : VMware.Vim.HostAuthenticationManagerInfo
FeatureVersion            : {faultTolerance}
PowerSystemCapability     : VMware.Vim.PowerSystemCapability
PowerSystemInfo           : VMware.Vim.PowerSystemInfo
CacheConfigurationInfo    :
WakeOnLanCapable          : False
FeatureCapability         : {cpuid.3DNOW, cpuid.3DNOWPLUS, cpuid.3DNPREFETCH, cpuid.ABM...}
MaskedFeatureCapability   : {cpuid.3DNOW, cpuid.3DNOWPLUS, cpuid.3DNPREFETCH, cpuid.ABM...}
VFlashConfigInfo          : VMware.Vim.HostVFlashManagerVFlashConfigInfo
VsanHostConfig            : VMware.Vim.VsanHostConfigInfo
DomainList                :
ScriptCheckSum            : {78, 46, 123, 153...}
HostConfigCheckSum        : {66, 148, 27, 74...}
GraphicsInfo              : {iLO4}
SharedPassthruGpuTypes    :
IoFilterInfo              :
LinkedView                :
#>

$vmhost.config.product
<#
Name                  : VMware ESXi
FullName              : VMware ESXi 6.0.0 build-7504637
Vendor                : VMware, Inc.
Version               : 6.0.0
Build                 : 7504637
LocaleVersion         : INTL
LocaleBuild           : 000
OsType                : vmnix-x86
ProductLineId         : embeddedEsx
ApiType               : HostAgent
ApiVersion            : 6.0
InstanceUuid          :
LicenseProductName    : VMware ESX Server
LicenseProductVersion : 6.0
#>

$vmhost.config.network
<#
Vswitch              : {vSwitch0}
ProxySwitch          :
Portgroup            : {key-vim.host.PortGroup-AJWE-P-142.106.160.0/25-Pres-Svr, key-vim.host.PortGroup-Management Network}
Pnic                 : {key-vim.host.PhysicalNic-vmnic0, key-vim.host.PhysicalNic-vmnic1, key-vim.host.PhysicalNic-vmnic2, key-vim.host.PhysicalNic-vmnic3...}
Vnic                 : {key-vim.host.VirtualNic-vmk0}
ConsoleVnic          :
DnsConfig            : VMware.Vim.HostDnsConfig
IpRouteConfig        : VMware.Vim.HostIpRouteConfig
ConsoleIpRouteConfig :
RouteTableInfo       : VMware.Vim.HostIpRouteTableInfo
Dhcp                 :
Nat                  :
IpV6Enabled          : False
AtBootIpV6Enabled    : False
NetStackInstance     : {, , defaultTcpipStack}
OpaqueSwitch         :
OpaqueNetwork        :
#>

$vmhost.config.network.pnic
<#
Key                                   : key-vim.host.PhysicalNic-vmnic0
Device                                : vmnic0
Pci                                   : 0000:02:00.0
Driver                                : tg3
LinkSpeed                             : VMware.Vim.PhysicalNicLinkInfo
ValidLinkSpecification                : {VMware.Vim.PhysicalNicLinkInfo, VMware.Vim.PhysicalNicLinkInfo, VMware.Vim.PhysicalNicLinkInfo,
                                        VMware.Vim.PhysicalNicLinkInfo...}
Spec                                  : VMware.Vim.PhysicalNicSpec
WakeOnLanSupported                    : True
Mac                                   : 9c:8e:99:5c:85:70
FcoeConfiguration                     :
VmDirectPathGen2Supported             : False
VmDirectPathGen2SupportedMode         :
ResourcePoolSchedulerAllowed          : True
ResourcePoolSchedulerDisallowedReason :
AutoNegotiateSupported                : True

Key                                   : key-vim.host.PhysicalNic-vmnic1
Device                                : vmnic1
Pci                                   : 0000:02:00.1
Driver                                : tg3
LinkSpeed                             :
ValidLinkSpecification                : {VMware.Vim.PhysicalNicLinkInfo, VMware.Vim.PhysicalNicLinkInfo, VMware.Vim.PhysicalNicLinkInfo,
                                        VMware.Vim.PhysicalNicLinkInfo...}
Spec                                  : VMware.Vim.PhysicalNicSpec
WakeOnLanSupported                    : True
Mac                                   : 9c:8e:99:5c:85:71
FcoeConfiguration                     :
VmDirectPathGen2Supported             : False
VmDirectPathGen2SupportedMode         :
ResourcePoolSchedulerAllowed          : True
ResourcePoolSchedulerDisallowedReason :
AutoNegotiateSupported                : True

Key                                   : key-vim.host.PhysicalNic-vmnic2
Device                                : vmnic2
Pci                                   : 0000:02:00.2
Driver                                : tg3
LinkSpeed                             :
ValidLinkSpecification                : {VMware.Vim.PhysicalNicLinkInfo, VMware.Vim.PhysicalNicLinkInfo, VMware.Vim.PhysicalNicLinkInfo,
                                        VMware.Vim.PhysicalNicLinkInfo...}
Spec                                  : VMware.Vim.PhysicalNicSpec
WakeOnLanSupported                    : True
Mac                                   : 9c:8e:99:5c:85:72
FcoeConfiguration                     :
VmDirectPathGen2Supported             : False
VmDirectPathGen2SupportedMode         :
ResourcePoolSchedulerAllowed          : True
ResourcePoolSchedulerDisallowedReason :
AutoNegotiateSupported                : True

Key                                   : key-vim.host.PhysicalNic-vmnic3
Device                                : vmnic3
Pci                                   : 0000:02:00.3
Driver                                : tg3
LinkSpeed                             :
ValidLinkSpecification                : {VMware.Vim.PhysicalNicLinkInfo, VMware.Vim.PhysicalNicLinkInfo, VMware.Vim.PhysicalNicLinkInfo,
                                        VMware.Vim.PhysicalNicLinkInfo...}
Spec                                  : VMware.Vim.PhysicalNicSpec
WakeOnLanSupported                    : True
Mac                                   : 9c:8e:99:5c:85:73
FcoeConfiguration                     :
VmDirectPathGen2Supported             : False
VmDirectPathGen2SupportedMode         :
ResourcePoolSchedulerAllowed          : True
ResourcePoolSchedulerDisallowedReason :
AutoNegotiateSupported                : True

Key                                   : key-vim.host.PhysicalNic-vmnic4
Device                                : vmnic4
Pci                                   : 0000:04:00.0
Driver                                : tg3
LinkSpeed                             :
ValidLinkSpecification                : {VMware.Vim.PhysicalNicLinkInfo, VMware.Vim.PhysicalNicLinkInfo, VMware.Vim.PhysicalNicLinkInfo,
                                        VMware.Vim.PhysicalNicLinkInfo...}
Spec                                  : VMware.Vim.PhysicalNicSpec
WakeOnLanSupported                    : True
Mac                                   : 2c:44:fd:99:00:d8
FcoeConfiguration                     :
VmDirectPathGen2Supported             : False
VmDirectPathGen2SupportedMode         :
ResourcePoolSchedulerAllowed          : True
ResourcePoolSchedulerDisallowedReason :
AutoNegotiateSupported                : True

Key                                   : key-vim.host.PhysicalNic-vmnic5
Device                                : vmnic5
Pci                                   : 0000:04:00.1
Driver                                : tg3
LinkSpeed                             : VMware.Vim.PhysicalNicLinkInfo
ValidLinkSpecification                : {VMware.Vim.PhysicalNicLinkInfo, VMware.Vim.PhysicalNicLinkInfo, VMware.Vim.PhysicalNicLinkInfo,
                                        VMware.Vim.PhysicalNicLinkInfo...}
Spec                                  : VMware.Vim.PhysicalNicSpec
WakeOnLanSupported                    : True
Mac                                   : 2c:44:fd:99:00:d9
FcoeConfiguration                     :
VmDirectPathGen2Supported             : False
VmDirectPathGen2SupportedMode         :
ResourcePoolSchedulerAllowed          : True
ResourcePoolSchedulerDisallowedReason :
AutoNegotiateSupported                : True
#>

$vmhost.config.network.vnic
<#
Device    : vmk0
Key       : key-vim.host.VirtualNic-vmk0
Portgroup : Management Network
Spec      : VMware.Vim.HostVirtualNicSpec
Port      : key-vim.host.PortGroup.Port-33554438
#>

$vmhost.config.network.dnsconfig
<#
Dhcp             : False
VirtualNicDevice :
HostName         : ITSPAJWEESX002
DomainName       : cihs.gov.on.ca
Address          : {142.145.56.190, 142.107.194.46}
SearchDomain     : {cihs.gov.on.ca}
#>


# Drill down into more details like the Datastore
$vmhostDatastoreName = $vmhost.datastore | Get-Viobjectbyviview | Select -ExpandProperty Name
$vmhostDatastore = get-view -viewtype Datastore -filter @{"Name"="$vmhostDatastoreName"}

$vmhostDatastore
<#
Info                : VMware.Vim.VmfsDatastoreInfo
Summary             : VMware.Vim.DatastoreSummary
Host                : {HostSystem-host-2043}
Vm                  : {VirtualMachine-vm-2784, VirtualMachine-vm-2049, VirtualMachine-vm-2839, VirtualMachine-vm-2048...}
Browser             : HostDatastoreBrowser-datastoreBrowser-datastore-2044
Capability          : VMware.Vim.DatastoreCapability
IormConfiguration   : VMware.Vim.StorageIORMInfo
LinkedView          :
Parent              : Folder-group-s10
CustomValue         : {}
OverallStatus       : gray
ConfigStatus        : gray
ConfigIssue         : {}
EffectiveRole       : {-1, 1247521967}
Permission          : {}
Name                : ITSPAJWEESX002_LS1
DisabledMethod      : {DatastoreExitMaintenanceMode_Task}
RecentTask          : {}
DeclaredAlarmState  : {alarm-202.datastore-2044, alarm-203.datastore-2044, alarm-35.datastore-2044, alarm-39.datastore-2044...}
TriggeredAlarmState : {}
AlarmActionsEnabled : True
Tag                 : {}
Value               : {}
AvailableField      : {}
MoRef               : Datastore-datastore-2044
Client              : VMware.Vim.VimClientImpl
#>

$vmhostDatastore.info
<#
MaxPhysicalRDMFileSize : 70368744177664
MaxVirtualRDMFileSize  : 68169720922112
Vmfs                   : VMware.Vim.HostVmfsVolume
Name                   : ITSPAJWEESX002_LS1
Url                    : ds:///vmfs/volumes/5284190e-789069b7-a868-2c44fd9900d8/
FreeSpace              : 1226117742592
MaxFileSize            : 69201586814976
MaxVirtualDiskCapacity : 68169720922112
MaxMemoryFileSize      : 70368744177664
Timestamp              : 2018-02-28 5:54:37 PM
ContainerId            :
#>


$vmhostDatastore.summary
<#
Datastore          : Datastore-datastore-2044
Name               : ITSPAJWEESX002_LS1
Url                : ds:///vmfs/volumes/5284190e-789069b7-a868-2c44fd9900d8/
Capacity           : 2995202818048
FreeSpace          : 1226117742592
Uncommitted        : 3783472302
Accessible         : True
MultipleHostAccess : False
Type               : VMFS
MaintenanceMode    : normal
LinkedView         :
#>









