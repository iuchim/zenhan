#include <cstdio>
#include <cstdlib>
#include <windows.h>

int
main(int argc, char** argv)
{
  constexpr LPARAM IMC_GETOPENSTATUS = 5;
  constexpr LPARAM IMC_SETOPENSTATUS = 6;

  auto hwnd = GetForegroundWindow();
  if (!hwnd)
    return -1;

  auto ime = ImmGetDefaultIMEWnd(hwnd);
  if (!ime)
    return -1;

  LPARAM stat = SendMessage(ime, WM_IME_CONTROL, IMC_GETOPENSTATUS, 0);
  LPARAM new_stat;
  if (argc >= 2) {
    new_stat = std::atoi(argv[1]);
    SendMessage(ime, WM_IME_CONTROL, IMC_SETOPENSTATUS, new_stat);
  }
  std::printf("%d\n", stat);
  return 0;
}
