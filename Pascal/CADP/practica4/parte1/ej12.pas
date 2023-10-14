(*  12. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) La cantidad de galaxias de cada tipo.
b) La masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) El nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.

b) un modulo que devuelva la masa total preguntando si es una de esas tres (if or or), a masa total le vamos sumando los valores que estan guardados y tambien hacemos que el procedimiento devuelva un porcentaje

*)
Program ej12;
const
  dimF = 53;
type
  str = string[20];
  
  galaxia = record
  nom: str;
  tipo: str; 
  masa: integer;
  dist: integer;
  end;
  
  contador = array [1..4] of integer;
  vector = array [1..dimF] of galaxia;
  
procedure inicializar (var c: contador; var cantReg, masa3, masaTotal, max1, max2, min1, min2: integer);
var i: integer;
  begin
    cantReg:= 0; masa3:= 0; masaTotal:= 0; max1:= -99; max2:= -99; min1:= 99; min2:= 99;
    for i:= 1 to 4 do
        c[i]:= 0;
  end;

procedure leer (var gal: galaxia);
  begin
    writeln('nombre: '); readln(gal.nom);
    writeln('tipo: '); readln(gal.tipo);
    writeln('masa: '); readln(gal.masa);
    writeln('distancia:'); readln(gal.dist);
  end;

procedure cargar (v: vector);
var i: integer;
  begin
    for i:= 1 to dimF do
        leer(v[i]);
  end;

procedure tipos (tipo: str; var c: contador);
  begin
      if (tipo = 'eliptica') then
        c[1]:= c[1] + 1
      else 
        if (tipo = 'espiral') then
          c[2]:= c[2] + 1
        else 
          if (tipo = 'lenticular') then
            c[3]:= c[3] + 1
          else 
            c[4]:= c[4] + 1;
  end;

procedure masa (nom: str; masa: integer; var masa3, masaTotal: integer);
  begin
    masaTotal:= masaTotal + masa;
    if (nom = 'via lactea') or (nom = 'andromeda') or (nom = 'triangulo') then
      masa3:= masa3 + masa;
  end;

function regular (tipo: str; dist: integer): boolean;
var aux: boolean;
  begin
    if (tipo <> 'irregular') and (dist < 1000) then
      aux:= true 
    else
      aux:= false;
    regular:= aux;
  end;

procedure maxYMin (nom: str; masa: integer; var max1, max2, min1, min2: integer; var nomMax1, nomMax2, nomMin1, nomMin2: str);
  begin
    if (masa > max1) then
      begin
        max2:= max1;
        nomMax2:= nomMax1;
        max1:= masa;
        nomMax1:= nom;
      end
    else if (masa > max2) then 
      begin
        max2:= masa;
        nomMax2:= nom;
      end;
    if (masa < min1) then
      begin
        min2:= min1;
        nomMin2:= nomMin1;
        min1:= masa;
        nomMin1:= nom;
      end
    else if (masa < min2) then 
      begin
        min2:= masa;
        nomMin2:= nom;
      end;
  end;

procedure imprimir (v: vector; c: contador; cantReg, masa3, porcentaje: integer; nomMax1, nomMax2, nomMin1, nomMin2: str);
  begin
      writeln('cantidad de galaxias eliptica: ', c[1]); 
      writeln('cantidad de galaxias espiral: ', c[2]);
      writeln('cantidad de galaxias lenticular: ', c[3]);
      writeln('cantidad de galaxias irregular: ', c[4]);
      writeln('masa acumulada de las 3 galaxias principales: ' ,masa3, ' .porcentaje que esto representa del total: ' ,porcentaje, '%');
      writeln('cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc: ' ,cantReg);
      writeln('galaxia con mayor masa: ' ,nomMax1, ' segunda con mayor masa: ' ,nomMax2, ' penultima galaxia con menor masa: ' ,nomMin2, ' y finalmente la de menor masa fue: ' ,nomMin1);
  end;

procedure incisos (v: vector);
var 
  c: contador; 
  i, cantReg, masa3, masaTotal, porcentaje, max1, max2, min1, min2: integer;
  nomMax1, nomMax2, nomMin1, nomMin2: str;
  begin
    inicializar(c, cantReg, masa3, masaTotal, max1, max2, min1, min2);
    cargar(v);

    for i:= 1 to dimF do
      begin
        tipos(v[i].tipo, c);
        masa(v[i].nom, v[i].masa, masa3, masaTotal);
        if (regular(v[i].tipo, v[i].dist)) then
          cantReg:= cantReg + 1;
        maxYMin(v[i].nom, v[i].masa, max1, max2, min1, min2, nomMax1, nomMax2, nomMin1, nomMin2);
      end;
    porcentaje:= (masa3 div masaTotal) * 100;
    imprimir(v, c, cantReg, masa3, porcentaje, nomMax1, nomMax2, nomMin1, nomMin2);
  end;

var 
v: vector;

Begin
  incisos(v);
End.