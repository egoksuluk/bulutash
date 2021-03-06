#!/usr/bin/env ruby

require "turkish_support"
require_relative 'kisi'

class Navigasyoni < Kisi
using TurkishSupport
  

     	def self.yukle (yukle)
     		dizin =  `pwd`
		`cp #{yukle} #{dizin}`
       	end

	def self.sil (sil)
        	`rm -f #{sil}`	
	end

	def self.istatistik (istatistik)
		
		dosya = File.new('veritabani.txt')
		satir = dosya.readlines.last
		dosya.close
		kota = satir.split(',')[3]
		
		@bilgi 	= `du -s #{istatistik}`
	 	bilgi 	= @bilgi.chomp.split(/\t/)
		diyez 	= (bilgi[0].to_f/((@kota.to_i)*1024/20)).to_f

		if diyez < 1 
			kullanim = 1
		else
			kullanim = diyez
		end 

		puts "Bulunduğunuz dizin: #{bilgi[1]}"
		puts "Kullanım miktarı: #{bilgi[0]} K"
		puts "Kullanım Grafiğiniz:"
		grafik = "[#{'#'*kullanim.to_i}                   ] #{bilgi[0]}K/#{@kota.to_i}M"
		puts grafik
			
	end        
	
	def self.listele
		dizin = `pwd`
		puts `ls -l #{dizin}`
	end	
end
