#exercicio

clear
NUM=1

function menu(){
	echo -e  "Elige una:\n0-Salir"
	echo "1- Compara dos numeros."
	echo "2- Crear un archivo o directorio en el escritorio si no existe. "
	echo "3- Nombre de Usuario y fecha del sistema: "
	echo "4- Crear una lista e imprimirla.  "
	echo "5- Saber si un número dado es primo "
	read -p "Prema una tecla: " NUM
}

function programa(){
	case $NUM in
	1) read -p "Introduce dos números: " num1
		read num2 
		if [ $num1 -gt $num2 ]
		then
			echo $num1 es mayor que $num2
		elif [ $num1 -eq $num2 ]
		then
			echo $num1 y $num2 son iguales
		else
			echo $num1 es menor que $num2
		fi
	;;
	2)
		read -p "Nombre del fichero o directorio: " FICHERO
		if [ -e /home/alumno/Desktop/$FICHERO ]
		then
			echo xa existe
		else
			read -p "a para archivo d para directorio: " DIR
			if [ $DIR == "a" ]
			then
				touch $FICHERO
			elif [ $DIR == "d" ]
			then
				mkdir $FICHERO
			else
				echo input no valido
			fi
		fi
	;;
	3)
		echo tu nombre de usuario es $(whoami)
		date
	;;
	4)
		read -p "Número de objetos de la lista: " NUMBER
		lista_Nombres=()
		for (( i=0; i<$NUMBER; i++))
		do
			read -p "Añade un input: " NOMBRE
			lista_Nombres[i]=$NOMBRE
		done
		echo ${lista_Nombres[@]}
	;;
	5)
		Resultado="Es Primo"
		read -p "Introduce un número: " NUM_PRIMO
		for (( i=2; i<$NUM_PRIMO/2; i++))
		do
			if [[ $(expr $NUM_PRIMO % $i) == 0 ]]
			then
				Resultado="No es Primo"
			fi
		done
		echo $Resultado
	;;
	esac
}

while (( $NUM != 0 ))
do
	menu
	clear
	programa
done


