(*
El productor musical Bizarrap organiza sesiones musicales con diferentes artistas. Se dispone de una estructura de datos con la información de las sesiones de Bizarrap. De cada sesión se conoce: título, nombre del artista, el género musical (1: Trap latino, 2: Reggaeton, 3: Urban, 4: Electrónica, 5: Pop Rap), año de estreno y cantidad de reproducciones en Spotify. La información no posee un orden específico.
Procesar la información anterior, para:
 A. Informar los dos códigos de género musical con menor cantidad de reproducciones en Spotify. 
 B. Generar una lista ordenada por año que contenga las sesiones del género "Trap Latino" y "Urban" cuya suma de los dígitos de la cantidad de reproducciones sea múltiplo de 5. 
 C. COMPLETO: Realizar un módulo que reciba la lista generada en el punto anterior e informe para cada año, la cantidad de sesiones realizadas junto al total de reproducciones de Spotify de esas sesiones. 
*)

program parcialTema2;
type
  rango = 1..5;

  sesion = record
    titulo: string;
    artista: string;
    genero: rango;
    anio: integer;
    reproducciones: integer;
  end;

  lista = ^nodo;

  nodo = record
    dato: sesion;
    sig: lista;
  end;

  vector = array [rango] of integer;



procedure inicializarV (var v: vector);
var i: rango;
  begin
    for i:= 1 to 5 do
      v[i]:= 0;
  end;

procedure leerSesion (var s: sesion);                          // SE DISPONE
  begin
      writeln('titulo: '); readln(s.titulo);
      writeln('artista: '); readln(s.artista);
      writeln('genero (1-5): '); readln(s.genero);
      writeln('anio: '); readln(s.anio);
      writeln('reproducciones: '); readln(s.reproducciones);
  end;

procedure agregarAtras (var l, ult: lista; s: sesion);         // SE DISPONE
var aux: lista;
  begin
    new(aux);
    aux^.dato:= s;
    aux^.sig:= nil;
    if (l = nil) then
      l:= aux
    else
      ult^.sig:= aux;
    ult:= aux;
  end;

procedure cargarLista (var l: lista);                       // SE DISPONE
var ult: lista; s: sesion;
  begin
    leerSesion(s);
    while (s.titulo <> 'pija') do begin
      agregarAtras(l, ult, s);
      leerSesion(s);
    end;
  end;

procedure insertarOrdenado (var k: lista; s: sesion);       // B
var act, ant, nue: lista;
  begin
    new(nue); nue^.dato:= s;
    act:= k; ant:= k;

    while (act <> nil) and (s.anio > act^.dato.anio) do begin
      ant:= act;
      act:= act^.sig;
    end;
    if (ant = act) then
      k:= nue
    else
      ant^.sig:= nue;
    nue^.sig:= act;
  end;

procedure minimos (v: vector; var codMin1, codMin2: integer);    //  A
var i, min1, min2: integer;
  begin
    min1:= 99; 
    min2:= 99;
    for i:= 1 to 5 do begin
      if (v[i] < min1) then
        begin
          min2:= min1;
          codMin2:= codMin1;
          min1:= v[i];
          codMin1:= i;
        end
      else if (v[i] < min2) then
        begin
          min2:= v[i];
          codMin2:= i;
        end;
    end;
  end;

function cumple (s: sesion): boolean;                   // B
var dig, suma: integer; 
begin
  suma:= 0;
  if (s.genero = 1) or (s.genero = 3) then begin
    while (s.reproducciones <> 0) do begin
      dig:= s.reproducciones mod 10;
      suma:= suma + dig;
      s.reproducciones:= s.reproducciones div 10;
    end;
  end;
  cumple:= ((suma mod 5) = 0);
end;

procedure informar (k: lista);                        //  C
var anioActual, cantSesiones, cantRepro: integer;
  begin
    while (k <> nil) do begin
      cantSesiones:= 0; cantRepro:= 0;
      anioActual:= k^.dato.anio;
      while (k <> nil) and (k^.dato.anio = anioActual) do begin
        cantSesiones:= cantSesiones + 1;
        cantRepro:= cantRepro + k^.dato.reproducciones;
        k:= k^.sig;
      end;
      writeln('el anio ' ,anioActual, ' conto con ' ,cantSesiones, ' sesiones y con un total de ' ,cantRepro, ' reproducciones entre todas ellas');
    end;
  end;

procedure incisos (l: lista; v: vector);
var codMin1, codMin2: integer; k: lista;
  begin
    k:= nil;
    while (l <> nil) do begin
      v[l^.dato.genero]:= v[l^.dato.genero] + l^.dato.reproducciones;                                 // A
      if (cumple(l^.dato)) then                                                                       // B
        insertarOrdenado(k, l^.dato);                                                                 // B
      l:= l^.sig;
    end;
    minimos(v, codMin1, codMin2); writeln('los minimos fueron: primero ' ,codMin1, ' y despues ' ,codMin2);   // A
    informar(k);                                                                                      // C
  end;

var
  l: lista;
  v: vector;
begin
	cargarLista(l);     // SE DISPONE
  inicializarV(v);
  incisos(l, v);
end.