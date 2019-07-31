unit Uxaudio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ClipBrd, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var                         
  Form1: TForm1;

implementation

{$R *.DFM}


procedure CopyStringToClipboard(const Value: String); // ����� ��� �������  uses ,
const
  RusLocale = (SUBLANG_DEFAULT shl $A) or LANG_RUSSIAN;
var
  hMem: THandle;
  pData: Pointer;
begin
  Clipboard.AsText:=value;  // �������������� �����. �� ��� �� ����������, ������ ������������
  Clipboard.Open;
  try
    Clipboard.AsText := Value;
    hMem := GlobalAlloc(GMEM_MOVEABLE, SizeOf(DWORD));
    try
      pData := GlobalLock(hMem);
      try
        DWORD(pData^) := RusLocale;
      finally
        GlobalUnlock(hMem);
      end;
        Clipboard.SetAsHandle(CF_LOCALE, hMem);
    finally
      GlobalFree(hMem);
    end;
  finally
    Clipboard.Close;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
CopyStringToClipboard('<img src="xoy.png" alt="" width=20><sup>���� ��</sup>');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
CopyStringToClipboard('<div class="q">');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
CopyStringToClipboard('<div class="kod">');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
CopyStringToClipboard('<table class="t292"><tr><td>');
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;   //  
form1.perform(WM_SysCommand,$F012,0);
end;

end.
