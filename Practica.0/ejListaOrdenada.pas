program abc;

const

	LIM_INF = 100;
	LIM_SUP = 150;
	CORTE = 120;

type

	lista = ^nodo;
	
	nodo = record
		elem : integer;
		sig : lista;
	end;

//modulos

	procedure insertarOrdenado(var pi : lista; x : integer);
	var
		nue,act,ant : lista;
	begin
		new(nue);
		nue^.elem := x;
		act := pi;
		ant := act;
		while (act <> nil) and (act^.elem < x) do begin
			ant := act;
			act := act^.sig;
		end;
		if (act = ant) then begin
			pi := nue;
		end
		else
			ant^.sig := nue;
		nue^.sig := act;
	end;
	
	procedure cargarListaOrdenada(var pi : lista);
	var
		num : integer;
	begin
		num := random(LIM_SUP - LIM_INF + 1) + LIM_INF;
		while (num <> CORTE) do begin
			insertarOrdenado(pi,num);
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
	
	function buscarElementoOrdenado(pi : lista; x : integer) : boolean;
	begin
		while (pi <> nil) and (pi^.elem < x) do begin
			pi := pi^.sig;
		end;
		buscarElementoOrdenado := (pi^.elem = x);
	end;
	
//programa principal

var

	pI : lista;
	num : integer;
		
begin
		
	Randomize;
	pI := nil;
	cargarListaOrdenada(pI);
	imprimirLista(pI);
	write('ingrese un numero: ');
	readln(num);
	if (buscarElementoOrdenado(pI,num)) then begin
		writeln('el numero ingresado SI se encuentra en la lista.');
	end
	else
		writeln('el numero ingresado NO esta en la lista.');

end.
	
