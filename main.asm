#include "includes.h"

using namespace std;

#pragma region Globals
extern "C" NTSTATUS NTAPI RtlAdjustPrivilege(ULONG Privilege, BOOLEAN Enable, BOOLEAN CurrentThread, PBOOLEAN Enabled);
#define SE_DEBUG_PRIVILEGE 20


char shell_code[] =
{
	0x60, 0xE8, 0x00, 0x00, 0x00, 0x00, 0x5B, 0x81, 0xEB, 0x06, 0x00, 0x00,
	0x00, 0xB8, 0xCC, 0xCC, 0xCC, 0xCC, 0x8D, 0x93, 0x022, 0x00, 0x00, 0x00,
	0x52, 0xFF, 0xD0, 0x61, 0x68, 0xCC, 0xCC, 0xCC, 0xCC, 0xC3 
};

void get_proc_id(const char* window_title, DWORD& process_id)
{
00E65380  push        ebp  
00E65381  mov         ebp,esp  
00E65383  sub         esp,0C0h  
00E65389  push        ebx  
00E6538A  push        esi  
00E6538B  push        edi  
00E6538C  lea         edi,[ebp-0C0h]  
00E65392  mov         ecx,30h  
00E65397  mov         eax,0CCCCCCCCh  
00E6539C  rep stos    dword ptr es:[edi]  
00E6539E  mov         ecx,offset _736EB7A5_main@cpp (0E74035h)  
00E653A3  call        @__CheckForDebuggerJustMyCode@4 (0E613A2h)  
	GetWindowThreadProcessId(FindWindow(NULL, window_title), &process_id);
00E653A8  mov         esi,esp  
00E653AA  mov         eax,dword ptr [process_id]  
00E653AD  push        eax  
00E653AE  mov         edi,esp  
00E653B0  mov         ecx,dword ptr [window_title]  
00E653B3  push        ecx  
00E653B4  push        0  
00E653B6  call        dword ptr [__imp__FindWindowA@8 (0E72128h)]  
00E653BC  cmp         edi,esp  
00E653BE  call        __RTC_CheckEsp (0E613B1h)  
00E653C3  push        eax  
00E653C4  call        dword ptr [__imp__GetWindowThreadProcessId@8 (0E72124h)]  
00E653CA  cmp         esi,esp  
00E653CC  call        __RTC_CheckEsp (0E613B1h)  
}
00E653D1  pop         edi  
00E653D2  pop         esi  
00E653D3  pop         ebx  
00E653D4  add         esp,0C0h  
00E653DA  cmp         ebp,esp  
00E653DC  call        __RTC_CheckEsp (0E613B1h)  
00E653E1  mov         esp,ebp  
00E653E3  pop         ebp  
00E653E4  ret  