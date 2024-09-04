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
	
	lend = record
		id : real;
		cantidadPrestamos : integer;
	end;
		
	arbol3 = ^node;
	
	node = record
		datito : lend;
		left : arbol3;
		right : arbol3;
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
		p.isbn := random(600);
		if (p.isbn <> 0) then begin
			p.socioNum := random(50) + 1;
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
	var
		aux : lista;
	begin
		if (ar <> nil) then begin
			mostrarArbol2(ar^.hijoL);
			writeln('prestamos del libro -> ',ar^.data.identificador:0:0);
			writeln(' ');
			aux := ar^.data.listaPrestamos;
			while(aux <> nil) do begin
				writeln('prestamo de la fecha: ',aux^.dato.diaInicio,'/',aux^.dato.mesInicio);
				writeln('Socio : ',aux^.dato.socioNum,', Libro: ',aux^.dato.isbn:0:0,', cantidad de dias prestado: ',aux^.dato.diasPrestado); 
				writeln(' ');
				aux := aux^.sig;
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
	begin
		if (ar^.hijoL <> nil) then
			minimoArbol := minimoArbol(ar^.hijoL)
		else
			minimoArbol := ar^.data.identificador;
	end;

	procedure cantidadDePrestamosSocio(ar : arbol; num : integer; var cant : integer);
	begin
		if (ar <> nil) then begin
			cantidadDePrestamosSocio(ar^.hijoI,num,cant);
			if (ar^.elem.socioNum = num) then 
				cant := cant + 1;
			cantidadDePrestamosSocio(ar^.hijoD,num,cant);
		end;
	end;

	procedure cargarDatos3(var ar : arbol3; p : prestamo);
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.datito.id := p.isbn;
			ar^.datito.cantidadPrestamos := 1;
			ar^.left := nil;
			ar^.right := nil;
		end
		else if (ar^.datito.id > p.isbn) then
			cargarDatos3(ar^.left,p)
		else if (ar^.datito.id < p.isbn) then
			cargarDatos3(ar^.right,p)
		else
			ar^.datito.cantidadPrestamos := ar^.datito.cantidadPrestamos + 1;
	end;
	
	procedure generarArbolNuevo(ar : arbol; var ar3 : arbol3);
	begin
		if (ar <> nil) then begin
			generarArbolNuevo(ar^.hijoI,ar3);
			cargarDatos3(ar3,ar^.elem);
			generarArbolNuevo(ar^.hijoD,ar3);
		end;
	end;
	
	procedure mostrarArbol3(ar : arbol3);
	begin
		if (ar <> nil) then begin
			mostrarArbol3(ar^.left);
			writeln('el libro con ISBN -> ',ar^.datito.id:0:0,' fue prestado ',ar^.datito.cantidadPrestamos,' de veces');
			writeln(' ');
			writeln('----------------------------------------------------------');
			mostrarArbol3(ar^.right);
		end;
	end;
	
	function contarPrestamos(pi : lista) : integer;
	var
		cant : integer;
	begin
		cant := 0;
		while (pi <> nil) do begin
			cant := cant + 1;
			pi := pi^.sig;
		end;
		contarPrestamos := cant;
	end;
	
	procedure cargarDatosLista(var ar : arbol3; p : prestamos);
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.datito.id := p.identificador;
			ar^.datito.cantidadPrestamos := contarPrestamos(p.listaPrestamos);
			ar^.left := nil;
			ar^.right := nil;
		end
		else if (p.identificador <= ar^.datito.id) then
			cargarDatosLista(ar^.left,p)
		else
			cargarDatosLista(ar^.right,p);
	end;
	
	procedure generarArbolNuevo2(ar2 : arbol2; var ar3 : arbol3);
	begin
		if (ar2 <> nil) then begin
			generarArbolNuevo2(ar2^.hijoL,ar3);
			cargarDatosLista(ar3,ar2^.data);
			generarArbolNuevo2(ar2^.hijoR,ar3);
		end;
	end;
	
	
	//programa principal

var

	ar : arbol;
	ar2 : arbol2;
	ar3,ar4 : arbol3;
	num, cant : integer;

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
	writeln(' ');
	writeln('el ISBN mas chico es: ',minimoArbol(ar2):0:0);
	writeln(' ');
	write('ingrese un numero de socio: ');
	readln(num);
	cant := 0;
	cantidadDePrestamosSocio(ar,num,cant);
	writeln(' ');
	writeln('la cantidad de prestamos realizados al socio -> ',num,' fue de: ',cant);
	ar3 := nil;
	generarArbolNuevo(ar,ar3);
	writeln(' ');
	writeln('arbol generado a partir de ar1: ');
	writeln('----------------------------------------------------------');
	mostrarArbol3(ar3);
	ar4 := nil;
	generarArbolNuevo2(ar2,ar4);
	writeln(' ');
	writeln('arbol generado a partir de ar2: ');
	writeln('----------------------------------------------------------');
	mostrarArbol3(ar4);
	
end.
