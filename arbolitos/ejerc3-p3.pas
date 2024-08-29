program chispa;

const

	LEGAJO_CORTE = 0;
	NOTA_MINIMA = 4;
	LIM_INF = 1;
	LIM_SUP_DIA = 31;
	LIM_SUP_MES = 12;
	LIM_INF_ANIO = 1999;
	LIM_SUP_ANIO = 2024;
	
type
	
	dias = LIM_INF..LIM_SUP_DIA;
	
	meses = LIM_INF..LIM_SUP_MES;
	
	anios = LIM_INF_ANIO..LIM_SUP_ANIO;
	
	date = record
		dia : dias;
		mes : meses;
		anio : anios;
	end;

	final = record
		lega : integer;
		codigoMateria : integer;
		nota : real;
		fecha : date;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato : final;
		sig : lista;
	end;
	
	alumno = record
		legajo : integer;
		finales : lista;
	end;
	
	arbol = ^node;
	
	node = record
		elem : alumno;
		hijoI : arbol;
		hijoD : arbol;
	end;
	
	alumnoResumen = record
		legajo : integer;
		promedio : real;
	end;
	
	listaT = ^nodito;
	
	nodito = record
		dato : alumnoResumen;
		next : listaT;
	end;
	
	
	//modulos
	
	procedure leerFecha(var fec : date);
	begin
		fec.dia := random(LIM_SUP_DIA - LIM_INF + 1) + LIM_INF;
		fec.mes := random(LIM_SUP_MES - LIM_INF + 1) + LIM_INF;
		fec.anio := random(LIM_SUP_ANIO - LIM_INF_ANIO + 1) + LIM_INF_ANIO;
	end;
	
	procedure leerFinal(var f : final);
	begin
		f.lega := random(1000);
		if (f.lega <> LEGAJO_CORTE) then begin
			f.codigoMateria := random(400) + 1;
			f.nota := random(10) + 1;
			leerFecha(f.fecha);
		end;
	end;
	
	procedure agregarAdelante(var pi : lista; examen : final);
	var
		nue : lista;
	begin
		new(nue);
		nue^.dato := examen;
		nue^.sig := pi;
		pi := nue;
	end;
	
	procedure cargarDatos(var ar : arbol; examen : final);
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.elem.legajo := examen.lega;
			ar^.elem.finales := nil;
			agregarAdelante(ar^.elem.finales,examen);
			ar^.hijoI := nil;
			ar^.hijoD := nil;
		end
		else if (examen.lega < ar^.elem.legajo) then
			cargarDatos(ar^.hijoI,examen)
		else if (examen.lega > ar^.elem.legajo) then
			cargarDatos(ar^.hijoD,examen)
		else
			agregarAdelante(ar^.elem.finales,examen);
	end;
	
	procedure cargarArbol(var ar : arbol);
	var
		test : final;
	begin
		leerFinal(test);
		if (test.lega <> LEGAJO_CORTE) then begin
			cargarDatos(ar,test);
			cargarArbol(ar);
		end;
	end;
	
	procedure mostrarAlumno(a : alumno);
	begin
		writeln('alumno, legajo -> ',a.legajo);
		writeln(' ');
		while (a.finales <> nil) do begin
			writeln('fecha : ',a.finales^.dato.fecha.dia,'/',a.finales^.dato.fecha.mes,'/',a.finales^.dato.fecha.anio);
			writeln('examen de la materia codigo: ',a.finales^.dato.codigoMateria);
			writeln('obtuvo nota con un puntaje de: ',a.finales^.dato.nota:0:0);
			writeln(' ');
			a.finales := a.finales^.sig;
		end;
		writeln('--------------------------------------------');
	end;
	
	procedure mostrarArbol(ar : arbol);
	begin
		if (ar <> nil) then begin
			mostrarArbol(ar^.hijoI);
			mostrarAlumno(ar^.elem);
			mostrarArbol(ar^.hijoD);
		end;
	end;
		
	procedure contarImpares(ar : arbol; var cantImpar : integer);
	begin
		if (ar <> nil) then begin
			contarImpares(ar^.hijoI,cantImpar);
			if ((ar^.elem.legajo mod 2) = 1) then
				cantImpar := cantImpar + 1;
			contarImpares(ar^.hijoD,cantImpar);
		end;
	end;
	
	procedure informarAlumno(leg : integer; materiasAprobadas : integer);
	begin
		writeln(' ');
		writeln('el alumno con legajo -> ',leg,' aprobo ',materiasAprobadas,' materia/s');
		writeln(' ');
		writeln('-------------------------------------------------------------');
	end;
	
	procedure analizarAlumno(a : alumno);
	var
		aprobadas : integer;
	begin
		aprobadas := 0;
		while(a.finales <> nil) do begin
			if (a.finales^.dato.nota >= NOTA_MINIMA) then
				aprobadas := aprobadas + 1;
			a.finales := a.finales^.sig;
		end;
		informarAlumno(a.legajo,aprobadas);
	end;
	
	procedure informarMaterias(ar : arbol);
	begin
		if (ar <> nil) then begin
			informarMaterias(ar^.hijoI);
			analizarAlumno(ar^.elem);
			informarMaterias(ar^.hijoD);
		end;
	end;
	
	procedure agregarAdelante2(var pi : listaT; aluResu : alumnoResumen);
	var
		nue : listaT;
	begin
		new(nue);
		nue^.dato := aluResu;
		nue^.next := pi;
		pi := nue;
	end;
	
	procedure verificarPromedio(a : alumno; filtro : real ; var pi : listaT);
	var
		aluRes : alumnoResumen;
		prom : real;
		cantFinales : integer;
	begin
		cantFinales := 0;
		prom := 0;
		while (a.finales <> nil) do begin
			cantFinales := cantFinales + 1;
			prom := prom + a.finales^.dato.nota;
			a.finales := a.finales^.sig;
		end;
		prom := prom/cantFinales;
		if (prom > filtro) then begin
			aluRes.legajo := a.legajo;
			aluRes.promedio := prom;
			agregarAdelante2(pi,aluRes);
		end;
	end;
	
	procedure filtrarPromedios(ar : arbol; filtro : real; var pi : listaT);
	begin
		if (ar <> nil) then begin
			filtrarPromedios(ar^.hijoI,filtro,pi);
			verificarPromedio(ar^.elem,filtro,pi);
			filtrarPromedios(ar^.hijoD,filtro,pi);
		end;
	end;
	
	procedure informarPromedios(pi : listaT; filtro : real);
	begin
		while (pi <> nil) do begin
			writeln('el alumno con legajo -> ',pi^.dato.legajo,', supero el filtro de promedios(',filtro:0:0,'), con un promedio de: ',pi^.dato.promedio:0:0);
			writeln(' ');
			writeln('----------------------------------------------------------');
			pi := pi^.next;
		end;
	end;
	
	//programa principal
	
	var
	
		ar : arbol;
		cantImpares : integer;
		num : real;
		listaCracks : listaT;
		
	begin
	
		Randomize;
		cargarArbol(ar);
		mostrarArbol(ar);
		cantImpares := 0;
		writeln (' ');
		contarImpares(ar,cantImpares);
		writeln('la cantidad de alumnos con legajo impar es: ',cantImpares);
		writeln(' ');
		informarMaterias(ar);
		writeln(' ');
		write('ingrese un numero para corroborar los promedios: ');
		readln(num);
		listaCracks := nil;
		filtrarPromedios(ar,num,listaCracks);
		writeln(' ');
		informarPromedios(listaCracks,num);
		
	end.
 
