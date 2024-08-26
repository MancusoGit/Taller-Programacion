program aguantaaa;

const

	INF = 300;
	SUP = 1550;
	MAX = 20;

type
	
	subVec = 1..MAX;

	vectorNum = array [subVec] of integer;
	
//modulos

	procedure vector20(var vec : vectorNum; var i : integer);
	begin
		i := i + 1;
		if (i <= MAX) then begin
			vec[i] := random(SUP - INF + 1) + INF;
			vector20(vec,i);
		end;
	end;
	
	procedure imprimirVector(vec : vectorNum; diml : integer; var i : integer);
	begin
		i := i + 1;
		if (i < diml) then begin
			writeln('el numero guardado en la posicion ',i,' es: ',vec[i]);
			imprimirVector(vec,diml,i);
		end;
	end;
	
	procedure ordenarVector(var vec : vectorNum; diml : integer);
	var
		i,j,pos,item : integer;
	begin
		for i := 1 to diml - 1 do begin
			pos := i;
			for j := i + 1 to diml do begin
				if (vec[pos] > vec[j]) then begin
					pos := j;
				end;
			end;
			item := vec[pos];
			vec[pos] := vec[i];
			vec[i] := item;
		end;
	end;


//programa principal

var

	vec : vectorNum;
	diml, i : integer;

begin
	
	Randomize;
	diml := 0;
	vector20(vec,diml);
	i := 0;
	imprimirVector(vec,diml,i);
	ordenarVector(vec,diml);
	writeln(' ');
	i := 0;
	imprimirVector(vec,diml,i);
end.
