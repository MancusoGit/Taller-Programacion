program tujavie;

const

	LIM_INF = 100;
	LIM_SUP = 150;
	CORTE = 120;
	
type
	
	lista = ^nodo;
	
	nodo = record
		elem: integer;
		sig : lista;
	end;
	
//modulos

	procedure agregarAdelante(var pi : lista; x : integer);
	var
		nue : lista;
	begin
		new(nue);
		nue^.elem := x;
		nue^.sig := pi;
		pi := nue;
	end;

	procedure cargarLista(var pi : lista);
	var
		num : integer;
	begin
		num := random(LIM_SUP - LIM_INF + 1) + LIM_INF;
		while (num <> CORTE) do begin
			agregarAdelante(pi,num);
			num := random(LIM_SUP - LIM_INF + 1) + LIM_INF;
		end;
	end;

	procedure imprimirLista(pi : lista);
	begin
		while (pi <> nil) do begin
			writeln('el numero almacenado es: ',pi^.elem);
			pi := pi^.sig;
		end;
	end;
	
	function buscarElemento(pi : lista; x : integer) : boolean;
	begin
		while (pi <> nil) and (pi^.elem <> x) do begin
			pi := pi^.sig;
		end;
		buscarElemento := (pi <> nil);
	end;
	
	//programa principal
	
	var
	
		pI : lista;
		num : integer;
		
	begin
		
		Randomize;
		pI := nil;
		cargarLista(pI);
		imprimirLista(pI);
		write('ingrese un numero: ');
		readln(num);
		if (buscarElemento(pI,num)) then begin
			writeln('el numero ingresado SI se encuentra en la lista.');
		end
		else
			writeln('el numero ingresado NO esta en la lista.');
	end.
 
