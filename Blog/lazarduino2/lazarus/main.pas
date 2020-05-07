unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  LazSerial, LazSynaSer;

type

  { Tmainfrm }

  Tmainfrm = class(TForm)
    btConectar: TButton;
    btEnviar: TButton;
    btConfigurar: TButton;
    edtexto: TEdit;
    LazSerial1: TLazSerial;
    mnRecibir: TMemo;
    Panel1: TPanel;
    procedure btConectarClick(Sender: TObject);
    procedure btConfigurarClick(Sender: TObject);
    procedure btEnviarClick(Sender: TObject);
    procedure LazSerial1RxData(Sender: TObject);
  private
    Texto: string; //Variable para almacenar datos recibidos
  public

  end;

var
  mainfrm: Tmainfrm;

implementation

{$R *.lfm}

{ Tmainfrm }

procedure Tmainfrm.btConectarClick(Sender: TObject);
begin
  LazSerial1.Active := True;
  edtexto.Enabled := True;
  btEnviar.Enabled := True;
end;

procedure Tmainfrm.btConfigurarClick(Sender: TObject);
begin
  LazSerial1.ShowSetupDialog;
end;

procedure Tmainfrm.btEnviarClick(Sender: TObject);
begin
  LazSerial1.WriteData(edtexto.Text);
end;

procedure Tmainfrm.LazSerial1RxData(Sender: TObject);
var
  Str: string;
begin
  str := LazSerial1.ReadData;
  if Length(str) > 1 then
  begin
    Texto := texto + str;
    if (Texto[Length(Texto)] = #13) or (Texto[Length(Texto)] = #10) then
    begin
      mnRecibir.Lines.add(texto);
      Texto := '';
    end;
  end;
end;

end.
