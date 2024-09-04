program ad;

type
	
	dias = 1..31;
	
	meses = 1..12;

	prestamo = record
		isbn : real;
		socioNum : integer;
		diaInicio : dias;
		mesInicio : meses;
		diasPrestado : integer;
	end;
	
	lista = ^nodito;
	
	nodito = record
		dato : prestamo;
		sig : lista;
	end;
	
	prestamos = record
		identificador : real;
		listaPrestamos : lista;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		elem : prestamo;
		hijoI : arbol;
		hijoD : arbol;
	end;
	
	arbol2 = ^nudo;
	
	nudo = record
		data : prestamos;
		hijoL : arbol2;
		hijoR : arbol2;
	end;
		
	

//modulos

	procedure agregarAdelante(var pi : lista; p : prestamo);
	var 
		nue : lista;
	begin
		new(nue);
		nue^.dato := p;
		nue^.sig := pi;
		pi := nue;
	end;
	
	procedure agregarDatos1(var ar : arbol; p : prestamo);
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.elem := p;
			ar^.hijoI := nil;
			ar^.hijoD := nil;
		end
		else if (p.isbn < ar^.elem.isbn) then
			agregarDatos1(ar^.hijoI,p)
		else
			agregarDatos1(ar^.hijoD,p);
	end;
	
	procedure agregarDatos2(var ar : arbol2; p : prestamo);
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.data.identificador := p.isbn;
			ar^.data.listaPrestamos := nil;
			ar^.hijoL := nil;
			ar^.hijoR := nil;
			agregarAdelante(ar^.data.listaPrestamos,p);
		end
		else if (p.isbn < ar^.data.identificador) then
			agregarDatos2(ar^.hijoL,p)
		else if (p.isbn > ar^.data.identificador) then
			agregarDatos2(ar^.hijoR,p)
		else
			agregarAdelante(ar^.data.listaPrestamos,p);
	end;

	procedure leerPrestamo(var p : prestamo);
	begin
		p.isbn := random(8000);
		if (p.isbn <> 0) then begin
			p.socioNum := random(5000) + 1;
			p.diaInicio := random(31) + 1;
			p.mesInicio := random(12) + 1;
			p.diasPrestado := random(365) + 1;
		end;
	end;
	
	procedure generarArboles(var ar : arbol; var ar2 : arbol2);
	var
		p : prestamo;
	begin
		leerPrestamo(p);
		if (p.isbn <> 0) then begin
			agregarDatos1(ar,p);
			agregarDatos2(ar2,p);
			generarArboles(ar,ar2);
		end;
	end;
	
	procedure mostrarArbol1(ar : arbol);
	begin
		if (ar <> nil) then begin
			mostrarArbol1(ar^.hijoI);
			writeln('prestamo de la fecha: ',ar^.elem.diaInicio,'/',ar^.elem.mesInicio);
			writeln(' ');
			writeln('Socio : ',ar^.elem.socioNum,', Libro: ',ar^.elem.isbn:0:0,', cantidad de dias prestado: ',ar^.elem.diasPrestado); 
			writeln('----------------------------------------------------------');
			mostrarArbol1(ar^.hijoD);
		end;
	end;
	
	procedure mostrarArbol2(ar : arbol2);
	begin
		if (ar <> nil) then begin
			mostrarArbol2(ar^.hijoL);
			writeln('prestamos del libro -> ',ar^.data.identificador:0:0);
			writeln(' ');
			while(ar^.data.listaPrestamos <> nil) do begin
				writeln('prestamo de la fecha: ',ar^.data.listaPrestamos^.dato.diaInicio,'/',ar^.data.listaPrestamos^.dato.mesInicio);
				writeln('Socio : ',ar^.data.listaPrestamos^.dato.socioNum,', Libro: ',ar^.data.listaPrestamos^.dato.isbn:0:0,', cantidad de dias prestado: ',ar^.data.listaPrestamos^.dato.diasPrestado); 
				writeln(' ');
				ar^.data.listaPrestamos := ar^.data.listaPrestamos^.sig;
			end;
			writeln('----------------------------------------------------------');
			mostrarArbol2(ar^.hijoR);
		end;
	end;
	
	function maximoArbol(ar : arbol) : real;
	begin
		if (ar^.hijoD <> nil) then begin
			maximoArbol := maximoArbol(ar^.hijoD);
		end
		else
			maximoArbol := ar^.elem.isbn;
	end;
	
	function minimoArbol(ar : arbol2) : real;


//programa principal

var

	ar : arbol;
	ar2 : arbol2;

begin

	Randomize;
	ar := nil;
	ar2 := nil;
	generarArboles(ar,ar2);
	writeln('arbol con todos los prestamos individuales. ');
	writeln(' ');
	writeln('----------------------------------------------------------');
	mostrarArbol1(ar);
	writeln(' ');
	writeln('arbol con la lista de prestamos. ');
	writeln(' ');
	writeln('----------------------------------------------------------');
	mostrarArbol2(ar2);
	writeln(' ');
	writeln('el ISBN mas grande es: ',maximoArbol(ar):0:0);
	
end.
