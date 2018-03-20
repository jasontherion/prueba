class AtmController < ApplicationController
	before_action :authenticate_user!
  def Index
  	 # valor_solicitado = 400000
  	 # @billete = ContarBilletes(valor_solicitado)
     # @devuelve = ValorRetirado(@billete,valor_solicitado)

      @informesDiarios = User.joins(:clientes=> :atms).select(:name, :dni,'atms.fecha_retiro , atms.valor_retiro').where(id: current_user.id)
  end

  def tratar_datos
  	  params['id_cuenta']
  	  params['total_retito'] 
     # valor_solicitado = 400000

  	  @billete = ContarBilletes(valor_solicitado)
      @devuelve = ValorRetirado(@billete ,params['total_retito'])
  end	

  def ContarBilletes valor_solicitado 	
  	billete = [1000,2000,5000, 10000, 20000, 50000, 100000]
    cant_billetes = []
    suma = 0
	  while(valor_solicitado >= suma)
	   	salida_billetes = billete.sample #random a la arreglo de billetes 
	   	cant_billetes.push(salida_billetes)
	    suma  = suma  + salida_billetes

	  end 
    cant_billetes
  end

  def ValorRetirado(billetes_retiro,valor_solicitado)
  	salida = []
  	sum = 0
    billetes_retiro.each { |a| sum+=a }
    
  puts "total de esta"
  puts sum
   puts valor_solicitado
  puts sum == valor_solicitado
    
    if sum == valor_solicitado
    	salida = sum # Si el valor es exacto  lo retorna
    else	
      #Buscamos la diferencia de la cantidad	
      valor_sobra =  sum - valor_solicitado 
      puts valor_sobra
       #Buscamos si un solo billete esta dando la diferencia
       if billetes_retiro.include?(valor_sobra)
          nuevo_array  = billetes_retiro.delete(20)
          nuevo_array.each { |a| sum+=a } #relizamos la suma de nuevo
          salida = [nuevo_array, sum] # retornamos array con nuevos valores
 	   else
 	   	salida = sum
       end 
    end   	

  end

  def InformeDiario
       @informesDiarios = User.joins(:clientes=>:atms).where(id: current_user.id)

  end

  private
      def grilla_params
         params.require(:atm).permit(:id_cuenta, :total_retito)
      end
end
