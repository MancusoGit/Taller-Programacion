program krmpotic;

const

	DIMF = 50;

type

	subrangoMerkera = 1..DIMF;
	
	vector = array [subrangoMerkera] of integer;
	
	

//modulos


	procedure cargarVector(var vec : vector; var diml : integer; a,b : integer);
	var
		num : integer;
	begin
		diml := 0;
		if (a < b) then begin
			num := random(b - a + 1) + a;
			while (num <> 0) and (diml < 50) do begin
				diml := diml + 1;
				vec[diml] := num;
				num := random(b - a + 1) + a;
			end;
		end
		else
			num := random(a - b + 1) + b;
			while (num <> 0) and (diml < 50) do begin
				diml := diml + 1;
				vec[diml] := num;
				num := random(a - b + 1) + b;
			end;
	end;
	
	procedure imprimirVector(vec : vector; diml : integer);
	var
		i : integer;
	begin
		for i := 1 to diml do begin
			writeln('el numero guardado en la posicion ',i,' del vector es: ',vec[i]);
		end;
	end;
	
	procedure ordenarVector(var vec: vector; diml : integer);
	var
		i,j,pos,item : integer;
	begin
		for i := 1 to diml - 1 do begin
			pos := i;
			for j := i + 1 to diml do begin
				if (vec[pos] < vec[j]) then //mayor a menor
					pos := j;
			end;
			item := vec[pos];
			vec[pos] := vec[i];
			vec[i] := item;
		end;
	end;

//programa principal

var

	vectorRandom : vector;
	diml,a,b : integer;
	
begin

	write('ingrese un numero: ');
	readln(a);
	write('ingrese un numero: ');
	readln(b);
	writeln('--------------------------------------------');
	cargarVector(vectorRandom,diml,a,b);
	writeln('vector original : ');
	writeln(' ');
	imprimirVector(vectorRandom,diml);
	ordenarVector(vectorRandom,diml);
	writeln('--------------------------------------------');
	writeln('vector ordenado : ');
	writeln(' ');
	imprimirVector(vectorRandom,diml);

end.
