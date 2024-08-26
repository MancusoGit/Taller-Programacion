program abc;

const

	INF = 100;
	SUP = 200;

type

	lista = ^nodo;
	
	nodo = record
		elem : integer;
		sig : lista;
	end;
		

//modulos

	procedure agregarAdelante(var pi : lista; num : integer);
	var
		nue : lista;
	begin
		new(nue);
		nue^.elem := num;
		nue^.sig := pi;
		pi := nue;
	end;

	procedure cargarLista(var pI : lista);
	var
		x : integer;
	begin
		x := random(SUP - INF + 1) + INF;
		if (x <> INF) then begin
			agregarAdelante(pI,x);
			cargarLista(pI);
		end;
	end;

	procedure imprimirLista(var pi : lista);
	begin
		if (pi <> nil) then begin
			writeln('el numero almacenado es : ',pi^.elem);
			pi := pi^.sig;
			imprimirLista(pi);
		end;
	end;
	
	procedure listaReversa(var pI,pIR : lista);
	begin
		if (pI <> nil) then begin
			agregarAdelante(pIR,pI^.elem);
			pI := pI^.sig;
			listaReversa(pI,pIR);
		end;
	end;
	
	procedure buscarMinimo(var pI : lista; var minimo: integer);
	begin
		if (pI <> nil) then begin
			if (pI^.elem < minimo) then
				minimo := pI^.elem;
			pI := pI^.sig;
			buscarMinimo(pI,minimo);
		end;
	end;
	
	procedure buscarNumero(var pI : lista; num : integer; var encontre : boolean);
	begin
		if (pI <> nil) and not encontre then begin
			if (pI^.elem = num) then begin
				encontre := true;
			end;
			pI := pI^.sig;
			buscarNumero(pI,num,encontre);
		end;
	end;

//programa principal

var

	pI, aux, pIR : lista;
	min : integer;
	encontre : boolean;
	
begin
	
	Randomize;
	pI := nil;
	cargarLista(pI);
	aux := pI;
	writeln('lista original : ');
	writeln(' ');
	imprimirLista(aux);
	writeln(' ');
	aux := pI;
	pIR := nil;
	listaReversa(aux,pIR);
	aux := pIR;
	writeln('lista reversa : ');
	writeln(' ');
	imprimirLista(pIR);
	writeln(' ');
	aux := pI;
	min := 9999;
	buscarMinimo(aux,min);
	writeln('el numero mas chico de la lista es el: ', min);
	writeln(' ');
	write('ingrese un numero para buscarlo en la lista: ');
	readln(min);
	aux := pI;
	encontre := false;
	buscarNumero(aux,min,encontre);
	writeln(' ');
	if encontre then
		writeln('el numero ',min,' SI estaba en la lista')
	else
		writeln('el numero ',min,' NO estaba en la lista')
		
end.
