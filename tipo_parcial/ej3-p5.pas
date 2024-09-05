program ab;

const

	MAX_RUBRO = 10;

type
	
	subrangoRubros = 1..MAX_RUBRO;
	
	producto =	record
		codigo : integer;
		rubro : subrangoRubros;
		stock : integer;
		precioUnitario : real;
	end;
	
	arbol = ^nodo;

	nodo = record
		elem : producto;
		hijoI : arbol;
		hijoD : arbol;
	end;
	
	vector = array [subrangoRubros] of arbol;
	

//modulos

	procedure leerProducto(var p : producto);
	begin
		p.codigo := random(500);
		if (p.codigo <> 0) then begin
			p.rubro := random(MAX_RUBRO) + 1;
			p.stock := random(9999);
			p.precioUnitario := random(9999) + 1;
		end;
	end;
	
	procedure cargarDatos(var ar : arbol; p : producto);
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.elem := p;
			ar^.hijoI := nil;
			ar^.hijoD := nil;
		end
		else if (ar^.elem.codigo >= p.codigo) then
			cargarDatos(ar^.hijoI,p)
		else
			cargarDatos(ar^.hijoD,p);
	end;

	procedure cargarVector(var vec : vector);
	var
		p : producto;
	begin
		leerProducto(p);
		if (p.codigo <> 0) then begin
			cargarDatos(vec[p.rubro],p);
			cargarVector(vec);
		end;
	end;

	procedure inicializarVector(var vec : vector);
	var
		i : integer;
	begin
		for i := 1 to MAX_RUBRO do begin
			vec[i] := nil;
		end;
	end;
	
	procedure mostrarArbol(ar : arbol);
	begin
		if (ar <> nil) then begin
			mostrarArbol(ar^.hijoI);
			writeln('producto codigo -> ',ar^.elem.codigo);
			writeln('perteneciente al rubro -> ',ar^.elem.rubro);
			writeln('con un stock de : ',ar^.elem.stock,', con un precio por unidad de: ',ar^.elem.precioUnitario:0:2);
			writeln(' ');
			writeln('----------------------------------------------------------------------');
			mostrarArbol(ar^.hijoD);
		end;
	end;
	
	procedure mostrarVector(vec : vector);
	var
		i : integer;
	begin
		for i := 1 to MAX_RUBRO do begin
			mostrarArbol(vec[i]);
		end;
	end;
	
	function buscarCodigoEnArbol(ar : arbol; cod : integer) : boolean;
	begin
		if (ar <> nil) then begin
			if (ar^.elem.codigo > cod) then
				buscarCodigoEnArbol := buscarCodigoEnArbol(ar^.hijoI,cod)
			else if (ar^.elem.codigo < cod) then
				buscarCodigoEnArbol := buscarCodigoEnArbol(ar^.hijoD,cod)
			else
				buscarCodigoEnArbol := true;
		end
		else
			buscarCodigoEnArbol := false;
	end;
	
	function buscarCodigo(vec : vector; rubro, cod : integer) : boolean;
	begin
		buscarCodigo := buscarCodigoEnArbol(vec[rubro],cod);
	end;
	
	procedure maximos(var maxCodigo
	
	

//programa principal

var

	vec : vector;
	rub, cod : integer;

begin

	Randomize;
	inicializarVector(vec);
	cargarVector(vec);
	writeln('MOSTRANDO PRODUCTOS: ');
	writeln(' ');
	writeln('----------------------------------------------------------------------');
	mostrarVector(vec);
	writeln(' ');
	write('ingrese un rubro: ');
	readln(rub);
	writeln(' ');
	write('ingrese un codigo: ');
	readln(cod); 
	writeln(' ');
	if (buscarCodigo(vec,rub,cod)) then
		writeln('producto encontrado.')
	else
		writeln('producto NO encontrado. ');

end.
