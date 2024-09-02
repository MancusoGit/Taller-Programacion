program ab;

type

	venta = record
		codigoVenta : integer;
		codigoProducto : integer;
		cantUni : real;
		precioUnitario : real;
	end;

	producto = record
		codigo : integer;
		unidades : real;
		monto : real;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		dato : producto;
		hijoI : arbol;
		hijoD : arbol;
	end;
	
	

//modulos

	procedure leerVenta(var v : venta);
	begin
		v.codigoVenta := random(9999);
		if (v.codigoVenta <> 0) then begin
			v.codigoProducto := random(1000);
			v.cantUni := random(9999) + 1;
			v.precioUnitario := random(5000) + 1;
		end;
	end;

	procedure cargarVenta(var ar : arbol; v : venta);
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.dato.codigo := v.codigoProducto;
			ar^.dato.unidades := v.cantUni;
			ar^.dato.monto := v.cantUni * v.precioUnitario;
		end
		else if (v.codigoProducto > ar^.dato.codigo) then
			cargarVenta(ar^.hijoD,v)
		else if (v.codigoProducto < ar^.dato.codigo) then
			cargarVenta(ar^.hijoI,v)
		else begin
			ar^.dato.unidades := ar^.dato.unidades + v.cantUni;
			ar^.dato.monto := ar^.dato.monto + (v.cantUni * v.precioUnitario);
		end;
	end;
	
	procedure cargarArbol(var ar : arbol);
	var
		v : venta;
	begin
		leerVenta(v);
		if (v.codigoVenta <> 0) then begin
			cargarVenta(ar,v);
			cargarArbol(ar);
		end;
	end;

//programa principal

var

	root : arbol;

begin

	Randomize;
	root := nil;
	cargarArbol(root);

end.
