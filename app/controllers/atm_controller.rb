class AtmController < ApplicationController
	before_action :authenticate_user!

  #Funcion aqui salen los reportes de las operaciones diarias	
  def Index
  	  @datos_salida = []
  	 # valor_solicitado = 400000
  	 # @billete = ContarBilletes(valor_solicitado)
     # @devuelve = ValorRetirado(@billete,valor_solicitado)
     if !params['total_retito'].nil? 
     	 @datos_salida = tratar_datos(params['id_cuenta'], params['total_retito'])
     	
     end
      @informesDiarios = User.joins(:clientes=> :atms).select(:name, :dni,'atms.fecha_retiro , atms.valor_retiro').where(id: current_user.id)
  end
  #Funcion intermediaria para captura de datos en modal
  def tratar_datos(tipo_cuenta, total_retito)

  	  billete = ContarBilletes(total_retito)
      devuelve = ValorRetirado(billete ,total_retito , tipo_cuenta)
      [billete, devuelve]
  end	
  #Funcion uno solicitada contar billetes segun un valor de retiro solicitado
  def ContarBilletes valor_solicitado 	
  	billete = [1000,2000,5000, 10000, 20000, 50000, 100000]
    cant_billetes = []
    suma = 0
	  while(valor_solicitado.to_i >= suma)
	   	salida_billetes = billete.sample #random a la arreglo de billetes 
	   	cant_billetes.push(salida_billetes)
	    suma  = suma  + salida_billetes

	  end 
    cant_billetes
  end
  #Funcion de operaciones retorna el total retirado e inserta en la tabla atm la operacion
  def ValorRetirado(billetes_retiro,valor_solicitado , tipo_cuenta)
  	salida = []
  	sum = 0
    billetes_retiro.each { |a| sum+=a }
    
	  puts "total de esta"
	  puts sum == valor_solicitado.to_i
     retiro =  Atm.new
     retiro.fecha_retiro = Time.now.strftime("%Y-%m-%d %H:%M:%S %Z")
     retiro.valor_retiro = sum
     retiro.save
    if sum == valor_solicitado.to_i
    	salida = sum # Si el valor es exacto  lo retorna
    else	
      #Buscamos la diferencia de la cantidad	
      valor_sobra =  sum - valor_solicitado.to_i
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
      def atm_params
         params.require(:atm).permit(:id_cuenta, :total_retito)
      end
end
