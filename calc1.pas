program loancalc;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes,
  math,
  sysutils
  { you can add units after this };

var
  Amount : Double;
  IRate : Double;
  Months : Integer;
  sTotal : string;

procedure DoubleLine;
begin
  //Just adds two blank lines.
  WriteLn();
  WriteLn();
end;

function ShowPayment(vAmount,vRate : Double; vMonths : Integer) : Double;
begin
  //This is the magic formla that does all the work.
  Result :=(vAmount*vRate/(100*12))*
  (1/(1-1/Math.power(1+vRate/(100*12),vMonths)));
end;

begin
     Write('Bens Loan Calclator.');
     DoubleLine();
     Write('Enter Loan Amount: ');
     Read(Amount);
     Write('Enter Intrest Rate: ');
     Read(IRate);
     Write('Enter Number of Months: ');
     Read(Months);
     DoubleLine();
     //Format the number
     sTotal := FormatFloat('#,##0.00', ShowPayment(Amount,IRate,Months));
     //Write out result.
     Write('Your total monthly payment is : ',sTotal);
     DoubleLine();
     Write('Press any key to exit.');
     ReadLn;
     ReadLn;
end.