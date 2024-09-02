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
		v.codigoVenta := random(5000);
		if (v.codigoVenta <> 0) then begin
			v.codigoProducto := random(999) + 1;
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
			ar^.hijoI := nil;
			ar^.hijoD := nil;
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
	
	procedure mostrarArbol(ar : arbol);
	begin
		if (ar <> nil) then begin
			mostrarArbol(ar^.hijoI);
			writeln(' ');
			writeln('producto codigo -> ',ar^.dato.codigo,' con un total de unidades vendidas: ',ar^.dato.unidades:0:0,' y un monto total de: ',ar^.dato.monto:0:2);
			writeln(' ------------------------------------------------------- ');	
			mostrarArbol(ar^.hijoD);
		end;
	end;
	
	function minimo(ar : arbol) : integer;
	begin
		if (ar^.hijoI <> nil) then
			minimo := minimo(ar^.hijoI)
		else
			minimo := ar^.dato.codigo;
	end;

	procedure masChicosPorParametro(ar : arbol; num : integer; var cant : integer);
	begin
		if (ar <> nil) then begin
			if (ar^.dato.codigo < num) then begin
				cant := cant + 1;
				masChicosPorParametro(ar^.hijoI,num,cant);
				masChicosPorParametro(ar^.hijoD,num,cant);
			end
			else 
				masChicosPorParametro(ar^.hijoI,num,cant);
		end;
	end;
	
	procedure codigosRango(ar : arbol; limInf, limSup : integer; var cant : integer);
	begin
		if (ar <> nil) then begin
			if (ar^.dato.producto >= limInf) and (ar^.dato.codigo =< limSup) then begin
				if (ar^.dato.producto > limInf) and (ar^.dato.producto < limSup) then
					cant := cant + 1;
				codigosRango(ar^.hijoI,limInf,limSup,cant);
				codigosRango(ar^.hijoD,limInf,limSup,cant);
			end
			else if (ar^.dato.producto > limSup) then
				codigosRango(ar^.hijoI,limInf,limSup,cant)
			else
				codigosRango(ar^.hijoD,limInf,limSup,cant)
		end;
	end;

//programa principal

var

	root : arbol;
	cant, num : integer;

begin

	Randomize;
	root := nil;
	cargarArbol(root);
	mostrarArbol(root);
	writeln(' ');
	writeln('el codigo de producto mas chico es: ',minimo(root));
	num := 30;
	cant := 0;
	masChicosPorParametro(root,num,cant);
	writeln(' ');
	writeln('la cantidad de codigos menores a ',num,' es: ',cant);
	
end.
