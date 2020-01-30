unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, dateutils;

type

  { TMainFrm }

  TMainFrm = class(TForm)
    btControl: TButton;
    lbTime: TLabel;
    Timer1: TTimer;
    procedure btControlClick(Sender: TObject);
    procedure Timer1StartTimer(Sender: TObject);
    procedure Timer1StopTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    Tiempo: TTime; //Almacena el número de segundos
    ModoDescanso: boolean; //Almacena el estado
  public

  end;

var
  MainFrm: TMainFrm;

implementation

{$R *.lfm}

{ TMainFrm }

procedure TMainFrm.btControlClick(Sender: TObject);
begin
  Timer1.Enabled := not Timer1.Enabled;
end;

procedure TMainFrm.Timer1StartTimer(Sender: TObject);
begin
  lbTime.Caption := '00:00';
  MainFrm.Caption := 'Tiempo Concentración';
  btControl.Caption := 'Detener';
  Tiempo := Time;
  ModoDescanso := False;
end;

procedure TMainFrm.Timer1StopTimer(Sender: TObject);
begin

  lbTime.Caption := '00:00';
  MainFrm.Caption := 'Cronómetro pomodoro';
  btControl.Caption := 'Arrancar';

end;

procedure TMainFrm.Timer1Timer(Sender: TObject);
var
  Actual: TTime;
begin

  Actual := Time - Tiempo;
  lbTime.Caption := FormatDateTime('nn:ss', actual);
  if (ModoDescanso = False) and (MinutesBetween(Time, Tiempo) = 25) then
  begin
    MainFrm.Caption := 'Tiempo Descanso';
    ModoDescanso := True;
    Tiempo := Time;
  end;
  if (ModoDescanso = True) and (MinutesBetween(Time, Tiempo) = 5) then
  begin
    Timer1.Enabled:= False;
  end;
end;

end.

