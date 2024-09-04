program unlp;

const

	CORTE = 0;
	
type
	
	reclamo = record
		codigo : integer;
		documento : real;
		anio : integer;
		tipo : integer;
	end;
	
	lista = ^nodito;
	
	nodito = record
		dato : reclamo;
		sig : lista;
	end;
	
	persona = record
		dni : real;
		reclamos : lista;
		totalReclamos : integer;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		elem : persona;
		hijoI : arbol;
		hijoD : arbol;
	end;
	
	listaC = ^node;
	
	node = record
		data : integer;
		sig : listaC;
	end;

//modulos

	procedure leerReclamo(var r : reclamo);
	begin
		r.codigo := random(100);
		if (r.codigo <> 0) then begin
			r.documento := random(900) + 1;
			r.anio := random(2024 - 1980 + 1) + 1980;
			r.tipo := random(10) + 1;
		end;
	end;
	
	procedure agregarAdelante(var pi : lista; r : reclamo);
	var
		nue : lista;
	begin
		new(nue);
		nue^.dato := r;
		nue^.sig := pi;
		pi := nue;
	end;
	
	procedure cargarDatos(var ar : arbol; r : reclamo);
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.elem.dni := r.documento;
			ar^.elem.reclamos := nil;
			agregarAdelante(ar^.elem.reclamos,r);
			ar^.elem.totalReclamos := ar^.elem.totalReclamos + 1;
			ar^.hijoI := nil;
			ar^.hijoD := nil;
		end
		else if (ar^.elem.dni > r.documento) then
			cargarDatos(ar^.hijoI,r)
		else if (ar^.elem.dni < r.documento) then
			cargarDatos(ar^.hijoD,r)
		else begin
			agregarAdelante(ar^.elem.reclamos,r);
			ar^.elem.totalReclamos := ar^.elem.totalReclamos + 1;
		end;
	end;
	
	procedure cargarArbol(var ar : arbol);
	var
		r : reclamo;
	begin
		leerReclamo(r);
		if (r.codigo <> 0) then begin
			cargarDatos(ar,r);
			cargarArbol(ar);
		end;
	end;
	
	procedure mostrarPersona(p : persona);
	begin
		writeln('individuo cuyo dni es -> ',p.dni:0:0);
		writeln(' ');
		writeln('reclamos que realizo: ');
		writeln(' ');
		while (p.reclamos <> nil) do begin
			writeln('reclamo codigo ',p.reclamos^.dato.codigo,' del tipo ',p.reclamos^.dato.tipo,' realizado el anio ',p.reclamos^.dato.anio);
			writeln(' ');
			p.reclamos := p.reclamos^.sig;
		end;
		writeln('----------------------------------------------------');
	end;

	procedure mostrarArbol(ar : arbol);
	begin
		if (ar <> nil) then begin
			mostrarArbol(ar^.hijoI);
			mostrarPersona(ar^.elem);
			mostrarArbol(ar^.hijoD);
		end;
	end;
	
	function cantidadReclamos(ar : arbol; num : integer) : integer;
	begin
		if (ar <> nil) then begin
			if (ar^.elem.dni > num) then
				cantidadReclamos := cantidadReclamos(ar^.hijoI,num)
			else if (ar^.elem.dni < num) then
				cantidadReclamos:= cantidadReclamos(ar^.hijoD,num)
			else
				cantidadReclamos := ar^.elem.totalReclamos;
		end
		else
			cantidadReclamos := 0;
	end;
	
	procedure reclamosEnSubrango(ar : arbol; limInf, limSup : real; var cant : integer);
	begin
		if (ar <> nil) then begin
			if (ar^.elem.dni >= limInf) and (ar^.elem.dni <= limSup) then begin
				cant := cant + ar^.elem.totalReclamos;
				reclamosEnSubrango(ar^.hijoI,limInf,limSup,cant);
				reclamosEnSubrango(ar^.hijoD,limInf,limSup,cant);
			end
			else if (ar^.elem.dni < limInf) then
				reclamosEnSubrango(ar^.hijoD,limInf,limSup,cant)
			else
				reclamosEnSubrango(ar^.hijoI,limInf,limSup,cant);
		end;
	end;
	
	procedure generarSubrango(var limInf, limSup : real);
	var
		aux : real;
	begin
		limInf := random(600) + 1;
		limSup := random(600) + 1;
		if (limInf > limSup) then begin
			aux := limInf;
			limInf := limSup;
			limSup := aux;
		end;
	end;
	
	procedure addForward(var pi : listaC; anio : integer);
	var
		nue : listaC;
	begin
		new(nue);
		nue^.data := anio;
		nue^.sig := pi;
		pi := nue;
	end;
	
	procedure corroborarAnio(pi : lista; year : integer;var l : listaC);
	begin
		while (pi <> nil) do begin
			if (pi^.dato.anio = year) then
				addForward(l,pi^.dato.codigo);
			pi := pi^.sig;
		end;
	end;
	
	procedure recorrerArbolito(ar : arbol; year : integer; var listaAnio : listaC);
	begin
		if (ar <> nil) then begin
			recorrerArbolito(ar^.hijoI,year,listaAnio);
			corroborarAnio(ar^.elem.reclamos,year,listaAnio);
			recorrerArbolito(ar^.hijoD,year,listaAnio);
		end;
	end;
	
	procedure mostrarCodigos(pi : listaC; year : integer);
	begin
		writeln('codigos de reclamo realizados en el anio -> ',year);
		writeln('                  |');
		writeln('                  V');
		while (pi <> nil) do begin
			writeln('             codigo: ',pi^.data);
			pi := pi^.sig;
		end; 
	end;

//programa principal

var

	ar : arbol;
	num, total, year : integer;
	limInf, limSup : real;
	listaCodigos : listaC;

begin

	Randomize;
	ar := nil;
	cargarArbol(ar);
	mostrarArbol(ar);
	writeln(' ');
	write('ingrese un numero de dni: ');
	readln(num);
	writeln(' ');
	writeln('la persona ',num,' realizo ',cantidadReclamos(ar,num),' de reclamo/s');
	total := 0;
	generarSubrango(limInf,limSup);
	reclamosEnSubrango(ar,limInf,limSup,total);
	writeln(' ');
	writeln('la cantidad total de reclamos efectuados por personas con dni entre ',limInf:0:0,' y ',limSup:0:0,' es: ',total);
	listaCodigos := nil;
	writeln(' ');
	write('ingrese un anio: ');
	readln(year);
	recorrerArbolito(ar,year,listaCodigos);
	writeln(' ');
	mostrarCodigos(listaCodigos,year);
	
end.
