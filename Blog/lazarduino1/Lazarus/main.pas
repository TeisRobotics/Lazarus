unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  LazSerial, LazSynaSer;

type

  { TLazSerialFrm }

  TLazSerialFrm = class(TForm)
    btConectar: TButton;
    btConfigurar: TButton;
    LazSerial1: TLazSerial;
    Memo1: TMemo;
    Panel1: TPanel;
    procedure btConectarClick(Sender: TObject);
    procedure btConfigurarClick(Sender: TObject);
    procedure LazSerial1RxData(Sender: TObject);
  private

  public

  end;

var
  LazSerialFrm: TLazSerialFrm;

implementation

{$R *.lfm}

{ TLazSerialFrm }

procedure TLazSerialFrm.btConectarClick(Sender: TObject);
begin
  LazSerial1.Active := True;
end;

procedure TLazSerialFrm.btConfigurarClick(Sender: TObject);
begin
  LazSerial1.ShowSetupDialog;
end;

procedure TLazSerialFrm.LazSerial1RxData(Sender: TObject);
begin
  Memo1.Lines.Add(LazSerial1.ReadData);
end;

end.

