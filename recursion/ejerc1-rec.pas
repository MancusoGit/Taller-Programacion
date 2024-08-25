program recursion;

const

	DIMF = 15;
	INF = 10;
	SUP = 155;
	
type

	subrangoVec = 1..DIMF;

	vectorNum = array [subrangoVec] of integer;
	
	
//modulos

	procedure cargarVector(var vec :  vectorNum; var diml : integer);
	var
		x : integer;
	begin
		x := Random(SUP - INF + 1) + INF;
		if (diml < DIMF) and (x <> 20) then begin
			diml := diml + 1;
			vec[diml] := x;
			cargarVector(vec, diml);
		end;
	end;
	
	procedure mostrarVectorNormal(vec : vectorNum; diml : integer);
	var
		i : integer;
	begin
		for i := 1 to diml do begin
			writeln('el numero guardado en el indice ',i,' es: ',vec[i]);
		end;
	end;
	
	procedure mostrarVectorRecursivo(vec : vectorNum; diml : integer; var i : integer);
	begin
		i := i + 1;
		if (i <= diml) then begin
			writeln('el numero guardado en el indice ',i,' es: ',vec[i]);
			mostrarVectorRecursivo(vec,diml,i);
		end;
	end;
	
	procedure sumarPares(vec : vectorNum; diml : integer; var resultado,i : integer);
	begin
		i := i + 1;
		if (i <= diml) then begin
			if ((vec[i] mod 2) = 0) then begin
				resultado := resultado + vec[i];
			end;
			sumarPares(vec,diml,resultado,i);
		end;
	end;
	
	procedure maximo(vec : vectorNum; diml : integer; var i, max : integer);
	begin
		i := i + 1;
		if (i <= diml) then begin
			if (max <= vec[i]) then begin
				max := vec[i];
			end;
			maximo(vec,diml,i,max);	
		end;
	end;
	
	procedure corroborar(vec : vectorNum; diml, num : integer; var i : integer; var encontre : boolean);
	begin
		i := i + 1;
		if (i > diml) then
			encontre := false
		else if (num = vec[i]) then 
			encontre := true
		else
			corroborar(vec,diml,num,i,encontre)
	end;
	
	function contarDigitos(x : integer) : integer;
	var
		cantDig : integer;
	begin
		cantDig := 0;
		while (x <> 0) do begin
			cantDig := cantDig + 1;
			x := x div 10;
		end;
		contarDigitos := cantDig;
	end;
	
	function potencia(x : integer) : integer;
	var
		i, n : integer;
	begin
		n := 1;
		for i := 1 to x - 1  do begin
			n := n * 10;
		end;
		potencia := n;
	end;
	
	procedure imprimirDigitos(vec : vectorNum; diml : integer; var i : integer);
	var
		j : integer;
	begin
		i := i + 1;
		if (i <= diml) then begin
			for j := contarDigitos(vec[i]) downto 1 do begin
				writeln(vec[i] div potencia(j));
				vec[i] := vec[i] mod potencia(j);	
			end;
			writeln(' ');
			imprimirDigitos(vec,diml,i);
		end;
	end;
	
	

//programa principal

var

	vector : vectorNum;
	diml,i,res,max,x : integer;
	encontre : boolean;
	
begin
	
	Randomize;
	diml := 0;
	cargarVector(vector,diml);
	writeln('vector normal: ');
	mostrarVectorNormal(vector,diml);
	writeln(' ');
	i := 0;
	writeln('vector recursivo: ');
	mostrarVectorRecursivo(vector,diml,i);
	writeln(' ');
	i := 0;
	res := 0;
	sumarPares(vector,diml,res,i);
	writeln('la suma de los numeros pares del vector da como resultado: ',res);
	i := 0;
	max := -1;
	maximo(vector,diml,i,max);
	writeln(' ');
	writeln('el numero mas grande del vector es: ',max);
	writeln(' ');
	write('ingrese un numero para corroborar que esta en el vector: ');
	readln(x);
	i := 0;
	corroborar(vector,diml,x,i,encontre);
	writeln(' ');
	if encontre then 
		writeln('estaba.')
	else
		writeln('no estaba.');
	writeln(' ');
	i := 0;
	imprimirDigitos(vector,diml,i);
	
		
end.
