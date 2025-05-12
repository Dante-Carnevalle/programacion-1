program parcial1;
const
TOPE=30;
type
  st10=string[10];
  tvb=array[1..TOPE] of byte;
  TVST=array[1..TOPE] of st10;
  tvr=array[1..TOPE] of real;
  tvbool=array[1..TOPE] of boolean;

  procedure inicializa ( var vaprob:tvbool);
  var
  i:byte;
  begin
    for i:=1 to TOPE do
        vaprob[i]:= false;
  end;
procedure leerarchivo (var vnota1,vnota2:tvb;var des1,dest:byte;var vaprob:tvbool;var vnom:tvst; var vprom:tvr; var N:byte;X:byte;porcentaje:real);
var
i,inas,saltear:byte;
nombre:st10;
car:char;
arch:text;
begin
     assign(arch,'text.txt'); reset(arch);
     n:=0;
     readln(arch,saltear);  des1:=0; dest:=0;
     while not eof (arch) do
           i:=0; nombre:=' ';
           read(arch,car);
           while car<>'.' do // lee el nombre
           begin
                i:=i+1;
                if i mod (saltear+1)=0 then
                   begin
                   nombre:=nombre+ car;
                   read(arch,car);
                   end;
           end;
           read(arch,inas);
           if inas<= X then // analiza solo aquellos que tengan hasta x faltas
           begin
                n:=n+1;
                vnom[n]:=nombre;
                readln(arch,vnota1[n],vnota2[n]);
                if (vnota1[n] >= 5) and ( vnota2[n] >=7) then
                    vaprob[n]:=true
                else
                   if (vnota1[n] < 5) or (vnota2[n] < 7) then
                      dest:= dest + 1
                else
                    if (vnota1[n] < 5) then
                        des1:=des1 +1;
                vprom[i]:=(vnota1[n] + vnota2[n])/2;
           end;
    close(arch);
    porcentaje:= (des1*100)/dest;
end;
 procedure buscaraprobado(vnota1,vnota2:tvb;vaprob:tvbool;vnom:tvst;N:byte);
 var
 i:byte;
 begin
      i:=1;
       while (i<N) and (vnota2[i] < vnota1[n]*1.2) or (vaprob[n]=false) do
       i:=i+1;
       if (vnota2[n] > vnota1[n]*1.2) and (vaprob[n]) then
          writeln('El alumno que aprobo la asignatura y se saco un 20 porciento mas en el segundo parcial es ',vnom[i])
       else
          writeln('el alumno buscado no existe');
 end;
var
vnota1,vnota2:tvb;
vprom:tvr;
vaprob:tvbool;
des1,dest,X,N:byte;
vnom:tvst;
porcentaje:real;
begin
     writeln('ingrese una cantidad de faltas');
     readln(X);
     inicializa(vaprob);
     leerarchivo(vnota1,vnota2,des1,dest,vaprob,vnom,vprom,N,X,porcentaje);
     writeln('La cantidad que saprobaron el primer parcial es ',porcentaje);
     buscaraprobado(vnota1,vnota2,vaprob,vnom,N);
end.

