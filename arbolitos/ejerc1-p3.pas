program adas;

type
	
	socio = record
		numero : integer;
		nombre : integer;
		edad : integer;
	end;

	arbol = ^nodo;
	
	nodo = record
		elem : socio;
		hijoI : arbol;
		hijoD : arbol;
	end;
	
	
//modulos

	procedure leerSocio(var s : socio);
	begin
		s.numero := random(90);
		if (s.numero <> 0) then begin
			s.nombre := random(999) + 1;
			s.edad := random(131);
		end;
	end;

	procedure agregarDatos(var ar : arbol; s : socio);
	begin
		if (ar = nil) then begin
			new (ar);
			ar^.elem := s;
			ar^.hijoI := nil;
			ar^.hijoD := nil;
		end
		else
			if (s.numero <= ar^.elem.numero) then
				agregarDatos(ar^.hijoI,s)
			else
				agregarDatos(ar^.hijoD,s);
	end;

	procedure cargarArbol(var ar : arbol);
	var
		s : socio;
	begin
		leerSocio(s);
		if (s.numero <> 0) then begin
			agregarDatos(ar,s);
			cargarArbol(ar);
		end;
	end;
	
	procedure mostrarEnOrden(ar : arbol);
	begin
		if (ar <> nil) then begin
			mostrarEnOrden(ar^.hijoI);
			writeln('socio con numero ',ar^.elem.numero,', edad : ',ar^.elem.edad,' nombre : ',ar^.elem.nombre);
			mostrarEnOrden(ar^.hijoD);
		end;
	end;
	
	procedure Max(var maxEdad, maxNum : integer; nueEdad, nueNum : integer);
	begin
		if (nueEdad >= maxEdad) then begin
			maxEdad := nueEdad;
			maxNum := nueNum;
		end;
	end;
	
	procedure encontrarMaximo(ar : arbol; var maxEdad, maxNum : integer);
	begin
		if (ar <> nil) then begin
			encontrarMaximo(ar^.hijoI,maxEdad,maxNum);
			Max(maxEdad,maxNum,ar^.elem.edad,ar^.elem.numero);
			encontrarMaximo(ar^.hijoD,maxEdad,maxNum);
		end;
	end;
	
	procedure aumentarImpares(ar : arbol; var cantImpar : integer);
	begin
		if (ar <> nil) then begin
			aumentarImpares(ar^.hijoI,cantImpar);
			if ((ar^.elem.edad mod 2) = 1) then begin
				ar^.elem.edad := ar^.elem.edad + 1;
				cantImpar := cantImpar + 1;
			end;
			aumentarImpares(ar^.hijoD,cantImpar);
		end;
	end;
	
	procedure buscarSocio(ar : arbol; nom : integer; var encontre : boolean);
	begin
		if (ar <> nil) and not encontre then begin
			buscarSocio(ar^.hijoI,nom,encontre);
			if (ar^.elem.nombre = nom) then begin
				encontre := true;
			end;
			buscarSocio(ar^.hijoD,nom,encontre)
		end;
	end;
	
	procedure contarSocios(ar : arbol; var cant : integer);
	begin
		if (ar <> nil) then begin
			contarSocios(ar^.hijoI,cant);
			cant := cant + 1;
			contarSocios(ar^.hijoD,cant);
		end;
	end;
	
	procedure sumaTotal(ar : arbol; var totalEdad : real);
	begin
		if (ar <> nil) then begin
			sumaTotal(ar^.hijoI,totalEdad);
			totalEdad := totalEdad + ar^.elem.edad;
			sumaTotal(ar^.hijoD,totalEdad);
		end;
	end;

//programa principal

var

	root : arbol;
	maxEdad, maxNum, cantImpar, nombreBusqueda, totalSocios : integer;
	encontre : boolean;
	totalEdad : real;

begin
	
	Randomize;
	cargarArbol(root);
	mostrarEnOrden(root);
	maxEdad := -1;
	maxNum := 0;
	encontrarMaximo(root,maxEdad,maxNum);
	writeln(' ');
	writeln('el socio con mayor edad es, ID : ',maxNum);
	writeln(' ');
	cantImpar := 0;
	aumentarImpares(root,cantImpar);
	writeln('la cantidad de socios editados fue de : ',cantImpar);
	writeln(' ');
	mostrarEnOrden(root);
	writeln(' ');
	write('ingrese un nombre para corroborar si se encuentra entre los socios: ');
	readln(nombreBusqueda);
	encontre := false;
	buscarSocio(root,nombreBusqueda,encontre);
	writeln(' ');
	if encontre then
		writeln('el nombre ',nombreBusqueda,' SI estaba en el arbol')
	else
		writeln('el nombre ',nombreBusqueda,' NO estaba en el arbol');
	writeln(' ');
	totalSocios := 0;
	contarSocios(root,totalSocios);
	writeln('la cantidad total de socios es de: ',totalSocios);
	writeln(' ');
	totalEdad := 0;
	sumaTotal(root,totalEdad);
	totalEdad := totalEdad / totalSocios;
	writeln('la edad promedio de los socios es: ',totalEdad:0:0);
		
end.
