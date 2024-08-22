program krmpotic2;

const
	
	MAX_OFICINAS = 300;

type
	
	subrangoVector = 1..MAX_OFICINAS;
	
	oficina = record
		codigo : integer;
		dni : integer;
		expensa : real;
	end;
	
	vectorOficina = array [subrangoVector] of oficina;
	
//modulos

	procedure leerOficina(var v : oficina);
	begin
		write('ingrese el codigo de la oficina: ');
		readln(v.codigo);
		if (v.codigo <> - 1) then begin
			write('ingrese el dni del propietario: ');
			readln(v.dni);
			write('ingrese el valor de la expensa: ');
			readln(v.expensa);
		end;
	end;
	
	procedure cargarVector(var vec : vectorOficina; var diml : integer);
	var
		ofi : oficina;
	begin
		diml := 0;
		leerOficina(ofi);
		while (ofi.codigo <> -1) and (diml < MAX_OFICINAS) do begin
			diml := diml + 1;
			vec[diml] := ofi;
			leerOficina(ofi);
		end;
	end;
	
	procedure ordenarVectorSeleccion(var vec: vectorOficina; diml : integer);
	var
		i,j,pos : integer;
		item : oficina;
	begin
		for i := 1 to diml - 1 do begin
			pos := i;
			for j := i + 1 to diml do begin
				if (vec[pos].codigo > vec[j].codigo) then begin
					pos := j;
				end
			end;
			item := vec[pos];
			vec[pos] := vec[i];
			vec[i] := item;
		end;
	end;
	
	procedure ordenarVectorInsercion(var vec :  vectorOficina; diml : integer);
	var
		i,j : integer;
		act : oficina;
	begin
		for i := 2 to diml do begin
			act := vec[i];
			j := i - 1;
			while (j > 0) and (vec[j].codigo > act.codigo) do begin
				vec[j + 1] := vec[j];
				j := j - 1;
			end;
			vec[j + 1] := act;
		end;
	end;
	
	procedure imprimirVector(vec : vectorOficina; diml : integer);
	var
		i : integer;
	begin
		for i := 1 to diml do begin
			writeln('la oficina con codigo ',vec[i].codigo, ' tiene de propietario al dni ', vec[i].dni,' con una expensa de: ',vec[i].expensa:0:2);
		end;
	end;
	

//programa principal

var

	oficinas, oficinas2 : vectorOficina;
	diml, diml2 : integer;

begin

	cargarVector(oficinas,diml);
	writeln('-----------------------------------.');
	ordenarVectorInsercion(oficinas,diml);
	imprimirVector(oficinas,diml);
	writeln('-----------------------------------.');
	cargarVector(oficinas2,diml2);
	writeln('-----------------------------------.');
	ordenarVectorSeleccion(oficinas2,diml2);
	imprimirVector(oficinas2,diml2);
	
end.
