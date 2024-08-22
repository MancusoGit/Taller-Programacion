program RP;

const

	MAX_GENEROS = 8;

type

	generos = 1..MAX_GENEROS;
	
	pelicula = record
		codigo : integer;
		genero : generos;
		puntaje : real;
	end;	
		
	lista = ^nodo;
	
	nodo = record
		elem : pelicula;
		sig : lista;
	end;
		
	
	resumenPeli  = record
		cod : integer;
		puntaje : real;
	end;
	
	vectorPelis = array [generos] of lista;
	
	vectorPelisGen = array[generos] of resumenPeli;


//modulos

	procedure leerPelicula(var p : pelicula);
	begin
		write('ingrese el codigo de la pelicula: ');
		readln(p.codigo);
		if (p.codigo <> -1) then begin
			p.genero := random(8) + 1;
			p.puntaje := random(10) + 1;
		end;
	end;

	procedure agregarAtras(var pI, ult : lista; p : pelicula);
	var
		nue : lista;
	begin
		new(nue);
		nue^.elem := p;
		nue^.sig := nil;
		if (pI = nil) then begin
			pI := nue;
			ult := nue;
		end
		else begin
			ult^.sig := nue;
			ult := nue;
		end;
	end;
	
	procedure inicializarListas(var vec : vectorPelis);
	var
		i : integer;
	begin
		for i := 1 to MAX_GENEROS do begin
			vec[i] := nil;
		end;
	end;
	
	procedure cargarPeliculas(var vec : vectorPelis); 
	var
		p : pelicula;
		vecUlt : vectorPelis;
	begin
		leerPelicula(p);
		while (p.codigo <> -1) do begin
			agregarAtras(vec[p.genero],vecUlt[p.genero],p);
			leerPelicula(p);
		end;
	end;
	
	procedure mostrarPelis(vec : vectorPelis);
	var
		i : integer;
	begin
		writeln('---------------------------------------');
		for i := 1 to MAX_GENEROS do begin
			writeln('peliculas del genero ',i,':');
			while (vec[i] <> nil) do begin
				writeln('pelicula con codigo ', vec[i]^.elem.codigo, ' con una puntuacion de : ', vec[i]^.elem.puntaje:0:1);
				vec[i] := vec[i]^.sig;
			end;
			writeln('---------------------------------------');
		end;
	end;
	
	procedure maxCodigo(var codigoMax : integer; var puntajeMax : real; codigoNue : integer; puntajeNue : real);
	begin
		if (puntajeNue >= puntajeMax) then begin
			puntajeMax := puntajeNue;
			codigoMax := codigoNue;
		end;
	end;
	
	procedure inicializarVector(var vec : vectorPelisGen);
	var 
		i : integer;
	begin
		for i := 1 to MAX_GENEROS do begin
			vec[i].cod := 0;
			vec[i].puntaje := 0;
		end;
	end;
	
	procedure procesarPeliculas(var vecNue : vectorPelisGen; vecOri : vectorPelis);
	var
		i, codMax : integer;
		puntajeMax : real;
	begin
		for i := 1 to MAX_GENEROS do begin
			codMax := -1;
			puntajeMax := -1;
			while (vecOri[i] <> nil) do begin
				maxCodigo(codMax,puntajeMax,vecOri[i]^.elem.codigo,vecOri[i]^.elem.puntaje);
				vecOri[i] := vecOri[i]^.sig;
			end;
			vecNue[i].cod := codMax;
			vecNue[i].puntaje := puntajeMax;
		end;
	end;

	
	procedure mostrarCodigoMax(vec : vectorPelisGen);
	var
		i : integer;
	begin
		for i := 1 to MAX_GENEROS do begin
			writeln('el puntaje de la pelicula con codigo ',vec[i].cod,' es: ',vec[i].puntaje:0:1);
		end;
	end;
	
	procedure ordenarVector(var vec : vectorPelisGen);
	var
		i,j,pos : integer;
		item : resumenPeli;
	begin
		for i := 1 to MAX_GENEROS - 1 do begin
			pos := i;
			for j := i + 1 to MAX_GENEROS do begin
				if (vec[pos].puntaje > vec[j].puntaje) then begin
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

	vectorPeliculas : vectorPelis;
	vectorCodigos : vectorPelisGen;

begin
	
	Randomize;
	inicializarListas(vectorPeliculas);	
	cargarPeliculas(vectorPeliculas);
	mostrarPelis(vectorPeliculas);
	inicializarVector(vectorCodigos);
	writeln('---------------------------------------');
	writeln('vector desordenado: ');
	procesarPeliculas(vectorCodigos,vectorPeliculas);
	mostrarCodigoMax(vectorCodigos);
	ordenarVector(vectorCodigos);
	writeln('---------------------------------------');
	writeln('vector ordenado: ');
	mostrarCodigoMax(vectorCodigos);
	
end.
