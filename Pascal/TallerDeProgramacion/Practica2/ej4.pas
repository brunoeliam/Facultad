program Ej4;
const
     nov=99;
     DimF=5;

type
  long=1..DimF;
  vector=array [long] of integer;

procedure IncisoA (var v:vector; var DimL:integer);
begin
  if (DimL<DimF) then begin
    DimL:=DimL+1;
    v[DimL]:=random(nov)+1;
    IncisoA (v,DimL);
  end;


end;

function IncisoB (v:vector;max:integer;i:integer):integer;
begin
     if (i<DimF) then begin
        if (v[i]>max) then
           max:=v[i];
        incisoB:= IncisoB (v,max,i+1);
     end
     else
         IncisoB:=max;
end;

function IncisoC (v:vector;tot:integer;i:integer):integer;
begin
     if (i<=DimF) then
        IncisoC:=IncisoC (v,tot+v[i],i+1)
     else
         IncisoC:=tot;
end;

var
   DimL:integer;
   v:vector;
   i:integer;

begin
  randomize;
  DimL:=0;
  IncisoA (v,DimL);
  for i:=1 to DimF do
      writeln (v[i]);
  writeln ('------');
  writeln (IncisoB (v,-1,1));
   writeln ('------');
  writeln (IncisoC (v,0,1));


  readln ();
end.
              