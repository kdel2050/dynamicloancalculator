unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls, math, LCLType;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function ShowPayment(vAmount,vRate : Double; vMonths : Double) : Double;
begin
  // Dosi calculation
  Result :=(vAmount*vRate/(100*12))*
  (1/(1-1/Math.power(1+vRate/(100*12),vMonths)));
end;

procedure TForm1.Label2Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);

var
  vA, vR, vM : Double;
  sTotal : string;
begin
  Label1.Caption := 'Amount: ' + TrackBar1.Position.ToString() + ' €';
  Label2.Caption := 'Interest: ' + (TrackBar2.Position/100).ToString() + ' %';
  Label3.Caption := 'Months: ' + TrackBar3.Position.ToString();

  vA := TrackBar1.Position.ToDouble();
  vR := TrackBar2.Position.ToDouble()/100;
  vM := TrackBar3.Position.ToDouble();

  sTotal := FormatFloat('#,##0.00', ShowPayment(vA,vR,vM));

  Label4.Caption := 'Monthly Payment: ' + sTotal + ' €';

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Reply, BoxStyle: Integer;
begin
  BoxStyle := MB_ICONQUESTION + MB_YESNO;
  Reply := Application.MessageBox('Do you want to exit the app??', 'Information:', BoxStyle);
  if Reply = IDYES then Application.Terminate();

end;

procedure TForm1.TrackBar1Change(Sender: TObject);

var
  vA, vR, vM : Double;
  sTotal : string;
begin
  Label1.Caption := 'Amount: ' + TrackBar1.Position.ToString() + ' €';
  Label2.Caption := 'Interest: ' + (TrackBar2.Position/100).ToString() + ' %';
  Label3.Caption := 'Months: ' + TrackBar3.Position.ToString();

  vA := TrackBar1.Position.ToDouble();
  vR := TrackBar2.Position.ToDouble()/100;
  vM := TrackBar3.Position.ToDouble();

  sTotal := FormatFloat('#,##0.00', ShowPayment(vA,vR,vM));

  Label4.Caption := 'Monthly Payment: ' + sTotal + ' €';

end;

procedure TForm1.TrackBar2Change(Sender: TObject);

var
  vA, vR, vM : Double;
  sTotal : string;
begin
  Label1.Caption := 'Amount: ' + TrackBar1.Position.ToString() + ' €';
  Label2.Caption := 'Interest: ' + (TrackBar2.Position/100).ToString() + ' %';
  Label3.Caption := 'Months: ' + TrackBar3.Position.ToString();

  vA := TrackBar1.Position.ToDouble();
  vR := TrackBar2.Position.ToDouble()/100;
  vM := TrackBar3.Position.ToDouble();

  sTotal := FormatFloat('#,##0.00', ShowPayment(vA,vR,vM));

  Label4.Caption := 'Monthly Payment: ' + sTotal + ' €';

end;

procedure TForm1.TrackBar3Change(Sender: TObject);

var
  vA, vR, vM : Double;
  sTotal : string;
begin
  Label1.Caption := 'Amount: ' + TrackBar1.Position.ToString() + ' €';
  Label2.Caption := 'Interest: ' + (TrackBar2.Position/100).ToString() + ' %';
  Label3.Caption := 'Months: ' + TrackBar3.Position.ToString();

  vA := TrackBar1.Position.ToDouble();
  vR := TrackBar2.Position.ToDouble()/100;
  vM := TrackBar3.Position.ToDouble();

  sTotal := FormatFloat('#,##0.00', ShowPayment(vA,vR,vM));

  Label4.Caption := 'Monthly Payment: ' + sTotal + ' €';

end;

end.

