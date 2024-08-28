program atr;

const

	LIM_INF = 1;
	LIM_SUP_DIA = 31;
	LIM_SUP_MES = 12;

type

	//primer arbol
	
	dias = LIM_INF..LIM_SUP_DIA;
	
	meses = LIM_INF..LIM_SUP_MES;
	
	date = record
		dia : dias;
		mes : meses;
		anio : integer;
	end;


	venta = record
		codigo : integer;
		fecha : date;
		unidades: integer;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		elem : venta;
		hijoI : arbol;
		hijoD : arbol;
	end;
	
	//segundo arbol
	
	producto = record
		codigo : integer;
		unidades : real;
	end;
	
	arbol2 = ^nodito;
	
	nodito = record
		dato : producto;
		hijoL : arbol2;
		hijoR : arbol2;
	end;
	
	//arbol de productos y sus ventas
	
	listaT = ^vent;
	
	vent = record
		data :  venta;
		sig : listaT;
	end;
	
	prodExt = record
		cod : integer;
		ventas : listaT;
	end;
	
	arbol3 = ^node;
		
	node = record
		storage : prodExt;
		hijitoL : arbol3;
		hijitoR : arbol3;
	end;
	

//modulos


//arbol ventas

procedure generarFecha(var f : date);
begin
	f.dia := random(LIM_SUP_DIA - LIM_INF + 1) + LIM_INF;
	f.mes := random(LIM_SUP_MES - LIM_INF + 1) + LIM_INF;
	f.anio := random(2024) + 1;
end;

procedure generarVenta1(var v : venta);
begin
	v.codigo := random(1000);
	if (v.codigo <> 0) then begin
		generarFecha(v.fecha);
		v.unidades := random(9999);
	end;
end;

procedure cargarDatos1(var ar :  arbol; v : venta);
begin
	if (ar = nil) then begin
		new(ar);
		ar^.elem := v;
		ar^.hijoI := nil;
		ar^.hijoD := nil;
	end
	else begin
		if (v.codigo < ar^.elem.codigo) then
			cargarDatos1(ar^.hijoI,v)
		else
			cargarDatos1(ar^.hijoD,v)
	end;
end;


procedure cargarArbol1(var ar : arbol);
var
	v : venta;
begin
	generarVenta1(v);
	if (v.codigo <> 0) then begin
		cargarDatos1(ar,v);
		cargarArbol1(ar);
	end;
end;

procedure mostrarVentas(ar : arbol);
begin
	if (ar <> nil) then begin
		mostrarVentas(ar^.hijoI);
		writeln('venta de la fecha ',ar^.elem.fecha.dia,'/',ar^.elem.fecha.mes,'/',ar^.elem.fecha.anio);
		writeln('producto (codigo) ',ar^.elem.codigo,', unidades: ',ar^.elem.unidades);
		writeln('------------------------------------------');
		mostrarVentas(ar^.hijoD);
	end;
end;

// arbol de productos:



procedure mostrarProductos(ar : arbol2);
begin
	if (ar <> nil) then begin
		mostrarProductos(ar^.hijoL);
		writeln('producto (codigo): ',ar^.dato.codigo,', unidades: ',ar^.dato.unidades:0:0);
		writeln('------------------------------------------');
		mostrarProductos(ar^.hijoR);
	end;
end;

procedure insertarProducto(var A: arbol2; v : venta);
begin
  if A = nil then
  begin
    new(A);
    A^.dato.codigo := v.codigo;
    A^.dato.unidades := v.unidades;
    A^.hijoL := nil;
    A^.hijoR := nil;
  end
  else if v.codigo < A^.dato.codigo then
    insertarProducto(A^.hijoL,v)
  else if v.codigo > A^.dato.codigo then
    insertarProducto(A^.hijoR,v)
  else
    A^.dato.unidades := A^.dato.unidades + v.unidades;
end;

procedure cargarArbol2(ar : arbol; var ar2 : arbol2);
begin
	if (ar <> nil) then begin
		insertarProducto(ar2,ar^.elem);
		cargarArbol2(ar^.hijoI,ar2);
		cargarArbol2(ar^.hijoD,ar2);
	end;
end;

//arbol productos y ventas

procedure agregarAdelante(var pi : listaT; v : venta);
var
	nue : listaT;
begin
	new(nue);
	nue^.data := v;
	nue^.sig := pi;
	pi := nue;
end;

procedure cargarNodo(var arb : arbol3; v : venta);
begin
	if (arb  = nil) then begin
		new(arb);
		arb^.storage.cod := v.codigo;
		arb^.storage.ventas := nil;
		agregarAdelante(arb^.storage.ventas,v);
		arb^.hijitoL := nil;
		arb^.hijitoR := nil;
	end
	else if v.codigo < arb^.storage.cod then
		cargarNodo(arb^.hijitoL,v)
	else if v.codigo > arb^.storage.cod then
		cargarNodo(arb^.hijitoR,v)
	else
		agregarAdelante(arb^.storage.ventas,v)
end;

procedure generarArbol3(ar : arbol; var arb : arbol3);
begin
	if (ar <> nil) then begin
		cargarNodo(arb, ar^.elem);
		generarArbol3(ar^.hijoI,arb);
		generarArbol3(ar^.hijoD,arb);
	end;
end;

procedure recorrerProd(p : prodExt);
begin
	writeln('Producto -> codigo = ',p.cod);
	writeln(' ');
	while (p.ventas <> nil) do begin
		writeln('venta de la fecha ',p.ventas^.data.fecha.dia,'/',p.ventas^.data.fecha.mes,'/',p.ventas^.data.fecha.anio);
		writeln('unidades vendidas: ',p.ventas^.data.unidades);
		writeln(' ');
		p.ventas := p.ventas^.sig;
	end;
	writeln('------------------------------------------');
end;

procedure mostrarProdsExt(ar : arbol3);
begin
	if (ar <> nil) then begin
		mostrarProdsExt(ar^.hijitoL);
		recorrerProd(ar^.storage);
		mostrarProdsExt(ar^.hijitoR);
	end;
end;


procedure generarArboles(var arb1 : arbol; var arb2 : arbol2; var arb3 : arbol3);
begin
	
	arb1 := nil;
	cargarArbol1(arb1);
	mostrarVentas(arb1);
	writeln(' ');
	arb2 := nil;
	cargarArbol2(arb1,arb2);
	mostrarProductos(arb2);
	writeln(' ');
	generarArbol3(arb1,arb3);
	mostrarProdsExt(arb3);

end;

function corroborar(fechaI, fechaC : date) : boolean;
begin
	corroborar := ((fechaI.dia = fechaC.dia) and (fechaI.mes = fechaC.mes) and (fechaI.anio = fechaC.anio)); 
end;

procedure contarFecha(ar : arbol; var cant : integer; fech : date);
begin
	if (ar <> nil) then begin
		contarFecha(ar^.hijoI,cant,fech);
		if (corroborar(ar^.elem.fecha,fech)) then
			cant := cant + ar^.elem.unidades;
		contarFecha(ar^.hijoD,cant,fech);
	end;
end;	

procedure mayor(var maxCant : real; var maxCod : integer; cantI : real; codI : integer);
begin
	if (cantI >= maxCant) then begin
		maxCod := codI;
		maxCant := cantI;
	end;
end;

procedure encontrarMayor(ar : arbol2; var codMax : integer; var cantMax : real);
begin
	if (ar <> nil) then begin
		encontrarMayor(ar^.hijoL,codMax,cantMax);
		mayor(cantMax,codMax,ar^.dato.unidades,ar^.dato.codigo);	
		encontrarMayor(ar^.hijoR,codMax,cantMax);
	end;
end;
	
procedure recorrerVentas(pi : listaT; var cantMax : real; var codigoMax : integer);
var
	cant : real;
	cod : integer;
begin
	cod := pi^.data.codigo;
	cant := 0;
	while (pi <> nil) do begin
		cant := cant + 1;
		pi := pi^.sig;
	end;
	mayor(cantMax,codigoMax,cant,cod);
end;

procedure encontrarMaxVentas(ar : arbol3; var codigoMax : integer; var cantMax : real);
begin
	if (ar <> nil) then begin
		encontrarMaxVentas(ar^.hijitoL,codigoMax,cantMax);
		recorrerVentas(ar^.storage.ventas,cantMax,codigoMax);
		encontrarMaxVentas(ar^.hijitoR,codigoMax,cantMax);
	end;
end;

//programa principal

var
	
	ar1 : arbol;
	ar2 : arbol2;
	ar3 : arbol3;
	fec : date;
	cant, codMax : integer;
	cantMax : real;

begin

	Randomize;
	generarArboles(ar1,ar2,ar3);
	write('ingrese el dia: ');
	readln(fec.dia);
	write('ingrese el mes: ');
	readln(fec.mes);
	write('ingrese el anio: ');
	readln(fec.anio);
	cant := 0;
	contarFecha(ar1,cant,fec);
	writeln(' ');
	writeln('en la fecha ',fec.dia,'/',fec.mes,'/',fec.anio,' se compraron un total de ',cant,' productos.');
	cantMax := -9999;
	codMax := 0;
	encontrarMayor(ar2,codMax,cantMax);
	writeln(' ');
	writeln('el producto con mayor cantidad de unidades vendidas es el prod. codigo -> ',codMax,', con una cantidad de : ',cantMax:0:0,' unidades vendidas');
	cantMax := -9999;
	codMax := 0;
	encontrarMaxVentas(ar3,codMax,cantMax);
	writeln(' ');
	writeln('el producto con mayor cantidad de ventas es el prod. codigo -> ',codMax,', con una cantidad de : ',cantMax:0:0,' ventas');
	
end.
