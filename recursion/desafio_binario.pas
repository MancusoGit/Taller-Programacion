program av;

const

	conv = 2;
	
type

	lista = ^nodo;
	
	nodo = record
		elem : integer;
		sig : lista;
	end;
	
//modulos

	procedure agregarAdelante(var pi: lista; x : integer);
	var
		nue : lista;
	begin
		new(nue);
		nue^.elem := x;
		nue^.sig := pi;
		pi := nue;
	end;

	procedure convertir(var x : integer; var pi : lista);
	begin
		if (x <> 0) then begin
			agregarAdelante(pi,x mod 2);
			x := x div 2;
			convertir(x,pi);
		end;
	end;
	
	procedure imprimirlista(pi :lista);
	begin
		while(pi <> nil) do begin
			write(pi^.elem);
			pi := pi^.sig;
		end;
	end;
	
	
	//programa principal
	
	var
	
		num, x : integer;
		pi : lista;
		
	begin
	
		write('ingrese un numero: ');
		readln(num);
		x := num;
		writeln(' ');
		pi := nil;
		convertir(num,pi);
		write(x,' en binario: ');
		imprimirlista(pi);
	
	end.
