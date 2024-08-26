program av;

	procedure convertir(x : integer);
	begin
		if (x <> 0) then begin
			convertir(x div 2);
			write(x mod 2);
		end;
	end;
	
	procedure convirtiendoNumeros(num : integer);
	begin
		if (num <> 0) then begin
			write(num,' en binario: ');
			convertir(num);
			writeln(' ');
			writeln(' ');
			write('ingrese un numero: ');
			readln(num);
			convirtiendoNumeros(num);
		end;
	end;
	
	
	//programa principal
	
	var
	
		num : integer;
		
	begin
	
		write('ingrese un numero: ');
		readln(num);
		convirtiendoNumeros(num);
		
	end.
