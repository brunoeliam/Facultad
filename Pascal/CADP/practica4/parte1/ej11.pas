(* El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página. *)

program ej11;
const 
  dimF = 3;

type
  rango = 1..dimF;

  str = string[20];

  fotos = record
  tit: str;
  autor: str;
  mg: integer;
  clics: integer;
  comen: integer;
  end;

  vector = array [rango] of fotos;


procedure leer (var fot: fotos);
  begin
    writeln('titulo de la foto:'); readln(fot.tit);
    writeln('autor:'); readln(fot.autor);
    writeln('cant de me gustas:'); readln(fot.mg);
    writeln('cant de clics:'); readln(fot.clics);
    writeln('cant de comentarios:'); readln(fot.comen);
  end;

procedure cargar (var v: vector);
var i: rango;
  begin
    for i:= 1 to dimF do
      leer(v[i]);
  end;
  

function cumple (autor: str): boolean;
var aux: boolean;
  begin
    if (autor = 'Art Vandelay') then
      aux:= true
    else 
      aux:= false;
    cumple:= aux;
  end;

procedure maximo (tit: str; clics: integer; var titMax: str; var max: integer);
  begin
    if (clics > max) then
      begin
        max:= clics;
        titMax:= tit;
      end;
  end;

procedure imprimir (v: vector; cantMg: integer; titMax: str);
  begin
    writeln('cantidad total de me gustas en fotos del autor falopa: ' ,cantMg);
    writeln('titulo de la foto con mas clics: ' ,titMax);
  end;

procedure imprimoCortito (comen: integer; tit: str);
  begin
    writeln('la cantidad de comentarios de la foto ' , tit , ' fue de: ' , comen);
  end;

procedure incisos (v: vector);
var 
i: rango; 
max, cantMg: integer;
titMax: str;

  begin
    max:= -1;
    cantMg:= 0;

    cargar(v);
    for i:= 1 to dimF do
      begin
        if (cumple(v[i].autor)) then
          cantMg:= cantMg + v[i].mg;
        maximo(v[i].tit, v[i].clics, titMax, max);
        imprimoCortito (v[i].comen, v[i].tit);
      end;
    imprimir(v, cantMg, titMax);
  end;

var                         ////
v: vector;

begin
  incisos(v);
end.