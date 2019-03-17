#!/bin/bash
echo 'Inserte la cadena de ADN' #le pide al usuario la cadena que desea ingresar
echo 'tenga en cuenta que solo debe ingresar letras a-c-t-g' #información para el estudiante
read adn #permite leer la cadena ingresada por el usuario
echo 'Inserte el numero de k-mers' #le pide al usuario el numero de k-mers que desea ingresar
read kmer #permite leer el número de kmer
if ! [[ "$kmer" =~ ^[0-9]+$ ]] #Permite corregir el error al ingresar un numero decimal en la variable kmer
   then
	   echo "por favor solo ingrese numeros enteros" #pide al usuario por favor corregir e ingresar un nuevo numero que no sea entero
read kmer #permite leer el k-mer al no ser un numero decimal
fi
ADN=$(echo $adn | tr 'a-z' 'A-Z') #Transforma adn en solo mayúsculas y los guarda en ADN
long=$(echo ${#adn}) #Cuenta cuantas letras tiene la variable adn
echo $resta #imprime la variable resta

while [ $long -lt $kmer ]
do #Corregir el problema de número mayor de kmer con respecto a la cadena de ADN (no es posible realizar las particiones)
        echo 'El k-mer ingresado es mayor a la longitud de ADN' #información para el usuario de la longitud del k-mer
        echo 'Ingrese otro número menor a éste' #pide al usuario corregir el número
        read kmer #permite leer el k-mer
done
let resta=$long-$kmer
for ((i=0;i<=$resta;i+=1)); #Rango de i para evitar errores al final cuando ya no haya combinaciones
do
     ARRAY[$i]=${ADN:$i:$kmer} #Sirve para recortar las cadenas de ADN y meterlo en un arreglo
done

sorted=($(sort <<<"${ARRAY[*]}")) #Ordena alfabéticamente el arreglo
printf "[%s]\n" "${sorted[@]}" > secuencias.txt #permite guardar la secuencia de adn en un archivo de texto.
