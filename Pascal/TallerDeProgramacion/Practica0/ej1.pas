{ 1.- Implementar un programa que procese la información de los alumnos de la Facultad de
Informática.
a) Implementar un módulo que lea y retorne, en una estructura adecuada, la información de
todos los alumnos. De cada alumno se lee su apellido, número de alumno, año de ingreso,
cantidad de materias aprobadas (a lo sumo 36) y nota obtenida (sin contar los aplazos) en cada
una de las materias aprobadas. La lectura finaliza cuando se ingresa el número de alumno
11111, el cual debe procesarse.
b) Implementar un módulo que reciba la estructura generada en el inciso a) y retorne número
de alumno y promedio de cada alumno.
c) Analizar: ¿qué cambios requieren los puntos a y b, si no se sabe de antemano la cantidad de
materias aprobadas de cada alumno, y si además se desean registrar los aplazos? ¿cómo
puede diseñarse una solución modularizada que requiera la menor cantidad de cambios? }

// a)

program ej1;
const
	dimF = 36;
type
	materias = 1..dimF;
	
	nota = 4..10;
	
	vNotas = array [materias] of nota;
	
	alumno = record
		ape: string;
		num: integer;
		año: integer;
		cantM: materias;
		nota: vNotas;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato: alumno;
		sig: lista;
	end;
	
	alumnoN = record
		num: integer;
		prom: real;
	end;
	
	listaN = ^nodoN;
	
	nodoN = record
		dato: alumnoN;
		sig: listaN;
	end;
	
procedure leerAlumno (var a: alumno);
begin
	readln(a.num);
	readln(a.ape);
	readln(a.año);
	readln(a.cantM);
end;

procedure agregarAdelante (var l: lista; a: alumno);
var aux: lista;
begin
	new(aux);
	aux^.dato:= a;
	aux^.sig:= l;
	l:= aux;
end; 

procedure cargarLista1 (var l: lista);
var a: alumno;
begin
	repeat
		leerAlumno(a);
		for i:= 1 to a.nota do
			readln(a.vNotas[i]);
		agregarAdelante(l, a);
	until (a.num = 11111);
end;

function promedio (a: alumno): real;
var total: integer;
begin 
	total:= 0;
	for i:= 1 to a.nota do 
		total:= total + a.vNotas[i]
	promedio:= total / a.nota;
end;

procedure incisoB (l: lista; var ln: listaN);
var an: alumnoN;
begin
	while (l <> nil) do begin
		an.num:= l^.dato.num;
		an.prom:= promedio(l^.dato);
		agregarAdelante(ln, an);
		l:= l^.sig;
	end;
end;


// prog. principal
var 
	l: lista;
	ln: listaN;
begin
	l:= nil;
	ln:= nil;
	cargarLista1(l);
	incisoB(l);
end;
