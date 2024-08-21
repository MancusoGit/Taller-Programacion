program avc;

const

	MAX_VENTAS = 50;
	MAX_UNIDADES = 99;

type

	subrangoVec = 1..MAX_VENTAS;
	
	codigoVenta = 1..15;
	
	dias = 0..31;
	
	maxUnidades = 1..MAX_UNIDADES;
	
	
	venta = record	
		dia : dias;
		codigo : codigoVenta;
		unidades : maxUnidades;
	end;

	vectorVentas = array [subrangoVec] of venta;


//modulos
	
	procedure leerVenta(var v : venta);
	begin
		write('ingrese el dia de la venta: ');
		readln(v.dia);
		if (v.dia <> 0) then begin
			v.codigo := random(15) + 1;
			write('ingrese la cantidad de unidades vendidas (1 - 99): ');
			readln(v.unidades);
		end;
	end;

	procedure cargarVector(var vec : vectorVentas; var diml :  integer);
	var
		v : venta;
	begin
		diml := 0;
		leerVenta(v);
		while (v.dia <> 0) and (diml < 50) do begin
			diml := diml + 1;
			vec[diml] := v;
			leerVenta(v);
		end; 
	end;
	
	procedure imprimirVector(vec : vectorVentas; diml : integer);
	var
		i : integer;
	begin
		for i := 1 to diml do begin
			writeln('el dia ',vec[i].dia,' se vendieron ',vec[i].unidades,' unidades del producto con codigo ', vec[i].codigo);
		end;
	end;
	
	procedure ordenarVector(var vec: vectorVentas; diml : integer);
	var
		i,j,pos : integer;
		item : venta;
	begin
		for i := 1 to diml - 1 do begin
			pos := i;
			for j := i + 1 to diml do begin
				if (vec[pos].codigo > vec[j].codigo) then begin //menos a mayor
					pos := j;
				end
			end;
			item := vec[pos];
			vec[pos] := vec[i];
			vec[i] := item;
		end;
	end;
	
	procedure eliminarElemento(var vec : vectorVentas; var diml : integer; pos : integer);
	var
		i : integer;
	begin
		for i := pos to diml - 1 do begin
			vec[i] := vec[i+1];
		end;
		diml := diml - 1;
	end;
	
	procedure recorrerVector (var vec : vectorVentas; var diml : integer);
	var
		i, lim_1, lim_2 : integer;
	begin
		write('Ingrese el primer numero del rango: ');
		readln(lim_1);
		write('Ingrese el segundo numero del rango: ');
		readln(lim_2);
	  
	  // ajustando que lim_1 sea el menor siempre 
		if (lim_1 > lim_2) then begin
			i := lim_1;
			lim_1 := lim_2;
			lim_2 := i;
		end;
	  
		i := 1;
		while (i <= diml) do begin
			if (vec[i].codigo >= lim_1) and (vec[i].codigo <= lim_2) then begin //corroboro que el codigo del indice i no sea el mismo que la iteracion anterior
				eliminarElemento(vec, diml, i);
			end 
			else begin
				i := i + 1; 
			end;
		end;
	end;
	
	procedure cargarVectorPares(var vecPar : vectorVentas; var dimlPar : integer; vecOriginal : vectorVentas; dimlVec1 : integer);
	var
		i : integer;
	begin
		dimlPar := 0;
		for i :=  1 to dimlVec1 do begin
			if ((vecOriginal[i].codigo mod 2) = 0) then begin
				dimlPar := dimlPar + 1;
				vecPar[dimlPar] := vecOriginal[i];
			end;
		end;
		ordenarVector(vecPar,dimlPar);
	end;
	

//programa principal

var

	ventas, ventasPares : vectorVentas;
	diml, dimlPares : integer;


begin
Randomize;
	cargarVector(ventas,diml);
	writeln('--------------------------------------');
	imprimirVector(ventas,diml);
	writeln('--------------------------------------');
	ordenarVector(ventas,diml);
	imprimirVector(ventas,diml);
	writeln('--------------------------------------');
	recorrerVector(ventas,diml);
	writeln('--------------------------------------');
	imprimirVector(ventas,diml);
	writeln('--------------------------------------');
	cargarVectorPares(ventasPares,dimlPares,ventas,diml);
	imprimirVector(ventasPares,dimlPares);
	writeln('--------------------------------------');
end.
