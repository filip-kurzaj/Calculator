#make_bin#  
 
; ( A ) 
  
include emu8086.inc 
     
   
          
                        
; ( B )  
 

START:    MOV AX,0h   
          MOV BX,0h
          MOV CX,0h
          MOV DX,0h
     
; ( C )             
        GOTOXY 1,0     
        PRINT '---KALKULATOR---'                    
        GOTOXY 1,2                        
        PRINT '1-NIC/WYJSCIE'  
        GOTOXY 1,3  
        PRINT '2-DODAWANIE'                                 
        GOTOXY 1,4  
        PRINT '3-ODEJMOWANIE'  
        GOTOXY 1,5  
        PRINT '4-ILOCZYN'  
        GOTOXY 1,6  
        PRINT '5-ILORAZ'  
        GOTOXY 1,7  
        PRINT '6-LOGICAL_AND'  
        GOTOXY 1,8  
        PRINT '7-LOGICAL_OR'  
        GOTOXY 1,9  
        PRINT '8-LOGICAL_XOR'
    
  
; ( D )  
 
    GOTOXY 3,11                         
    PRINT 'PODAJ PIERWSZA LICZBE:  '       
    CALL SCAN_NUM                       
    MOV [0200h],CX                      
    MOV AX,CX                            
    GOTOXY 3,12                       
 
; ( E )   
    
    PRINT 'PODAJ DRUGA LICZBE:     ' 
    CALL SCAN_NUM                     
    MOV [0202h],CX                 
    MOV CX,0h                        
      
; ( F )       
                   GOTOXY 2,14             
                   PRINT 'WYBIERZ DZIALANIE: '  
CHOOSE_FALSE_A:    CALL SCAN_NUM        
     
; ( G ) 
  
GOTOXY 1,15                    
CMP CX,1h        
JE NIC     
CMP CX,2h       
JE SUMA   
CMP CX,3h  
JE ROZNICA    
CMP CX,4h       
JE ILOCZYN
CMP CX,5h        
JE ILORAZ    
CMP CX,6h         ; SIGKRISI AMA TO CX INE ISO ME 6  
JE LOGIKO_AND     ;   EAN TO CX INE ISO ME 6 TOTE TO PROGRAMMA THA KANI ALMA EKI POU VRISKETE TO LABEL ME ONOMA "LOGIKO_AND"  
CMP CX,7h         ; SIGKRISI AMA TO CX INE ISO ME 7  
JE LOGIKO_OR      ;   EAN TO CX INE ISO ME 7 TOTE TO PROGRAMMA THA KANI ALMA EKI POU VRISKETE TO LABEL ME ONOMA "LOGIKO_OR"  
CMP CX,8h         ; SIGKRISI AMA TO CX INE ISO ME 8  
JE LOGIKO_XOR
 
; ( H )  
 
JMP FALSE_A 
      
  
  
; ( I )   
  
 ; ( 1 ) 
  
NIC:                                   ; ERXETE EDO OTAN TO CX INE ISO ME TO 1  
                      JMP START           ; KANI ALMA STO TELOS TOU PROGRAMMATOS  
                     
          
          
 ; ( 2 ) 
           
SUMA:                                ; ERXETE EDO OTAN TO CX INE ISO ME TO 2  
                   CALL SUMA_a       ; KALOUME TIN IPOROUTINA "PROSTHESIa"  
                   JMP WYNIK         ; KANI ALMA STO LABEL "APOTELESMA" GIA TIN EMFANISI TOU APOTELESMATOS   
SUMA_a:                                   
                      PRINT 'SUMA'  ; EMFANISI MINIMATOS  
                      ADC AX,[0202h]      ; KANI PROSTHESI OTI IPARXI STON AX ME OTI IPARXI STI THESI MNIMIS [0202h] KAI APOTHIKEVI TO APOTELESMA STON AX  
                      MOV [0204h],AX      ; KANI ANTIGRAFI TO PERIEXOMENO TOU AX STI THESI MNIMIS [0204] 
                      RET                 ; META TO TELOS TIS IPOROUTINAS EPISTREFOUME STIN AMESOS EPOMENI ENTOLI APO EKI POU TIN KALESAME   
  
 ; ( 3 )    
ROZNICA:                                  ; ERXETE EDO OTAN TO CX INE ISO ME TO 3   
                   CALL ROZNICA_a         ; KALOUME TIN IPOROUTINA "AFERESIa"  
                   JMP WYNIK         ; KANI ALMA STO LABEL "APOTELESMA"  
ROZNICA_a:         
                      PRINT 'ROZNICA'    ; EMFANISI MINIMATOS  
                      SBB AX,[0202h]      ; KANI AFAIRESI OTI IPARXI STON AX ME OTI IPARXI STI THESI MNIMIS [0202h] KAI APOTHIKEVI TO APOTELESMA STON AX  
                      MOV [0204h],AX      ; KANI ANTIGRAFI TO PERIEXOMENO TOU AX STI THESI MNIMIS [0204] 
                      RET                 ; META TO TELOS TIS IPOROUTINAS EPISTREFOUME STIN AMESOS EPOMENI ENTOLI APO EKI POU TIN KALESAME  
 ; ( 4 ) 
  
ILOCZYN:                              ; ERXETE EDO OTAN TO CX INE ISO ME TO 4   
                   CALL ILOCZYN_a     ; KALOUME TIN IPOROUTINA "POLLAPLASIASMOSa"  
                   JMP WYNIK             ; KANI ALMA STO LABEL "APOTELESMA" GIA TIN EMFANISI TOU APOTELESMATOS   
ILOCZYN_a:    
                      PRINT 'ILOCZYN'; EMFANISI MINIMATOS    
                      MOV BX,[0202h]          ; ANTIGRAFI STON KATAXORITI BX OTI IPARXI STI THESI MNIMIS [0202h]  
                      MUL BX                  ; POLLAPLASIASMOS TOU KATAXORITI BX ME TON KATAXORITI AX KAI APOTHIKEVETE TO APOTELESMA STON AX  
                      MOV [0204h],AX          ; KANI ANTIGRAFI TO PERIEXOMENO TOU AX STI THESI MNIMIS [0204] 
                      RET                     ; META TO TELOS TIS IPOROUTINAS EPISTREFOUME STIN AMESOS EPOMENI ENTOLI APO EKI POU TIN KALESAME  
            
; ( 5 )            
          
ILORAZ:                             ; ERXETE EDO OTAN TO CX INE ISO ME TO 5   
                   CALL ILORAZ_a    ; KALOUME TIN IPOROUTINA "DIERESIa"  
                   JMP WYNIK    ; KANI ALMA STO LABEL "APOTELESMA" GIA TIN EMFANISI TOU APOTELESMATOS   
ILORAZ_a:      
                   PRINT 'ILORAZ'  ; EMFANISI MINIMATOS   
                      MOV BX,[0202h] ; ANTIGRAFI STON KATAXORITI BX OTI IPARXI STI THESI MNIMIS [0202h]  
                      DIV BX         ; DIERESI TOU KATAXORITI BX ME TON KATAXORITI AX, TO APOTELESMA APOTHIKEVETE STON AX KAI TO IPOLIPO STON DX  
                      MOV [0204h],AX ; KANI ANTIGRAFI TO PERIEXOMENO TOU AX STI THESI MNIMIS [0204] 
                      MOV [0206h],DX ; KANI ANTIGRAFI TO PERIEXOMENO TOU DX STI THESI MNIMIS [0206]  
                      RET            ; META TO TELOS TIS IPOROUTINAS EPISTREFOUME STIN AMESOS EPOMENI ENTOLI APO EKI POU TIN KALESAME  
             
 ; ( 6 )            
             
LOGIKO_AND:                               ; ERXETE EDO OTAN TO CX INE ISO ME TO 6  
                   CALL LOGIKO_AND_a      ; KALOUME TIN IPOROUTINA "LOGIKO_ANDa"  
                   JMP WYNIK         ; KANI ALMA STO LABEL "APOTELESMA" GIA TIN EMFANISI TOU APOTELESMATOS   
LOGIKO_AND_a:     
                      PRINT 'LOGIKO AND ' ; EMFANISI MINIMATOS    
                      AND AX,[0202h]      ; XRISIMOPOIEI TIN PRAKSI TOU LOGIKOU AND GIA TO AX ME OTI IPARXI STI THESI MNIMIS [0202h] KAI TO APOTELESMA APOTHIKEVETE STON AX  
                      MOV [0204h],AX      ; KANI ANTIGRAFI TO PERIEXOMENO TOU AX STI THESI MNIMIS [0204] 
                      RET                 ; META TO TELOS TIS IPOROUTINAS EPISTREFOUME STIN AMESOS EPOMENI ENTOLI APO EKI POU TIN KALESAME  
             
 ; ( 7 )            
             
LOGIKO_OR:                                  ; ERXETE EDO OTAN TO CX INE ISO ME TO 7  
                   CALL LOGIKO_OR_a         ; KALOUME TIN IPOROUTINA "LOGIKO_ORa"  
                   JMP WYNIK           ; KANI ALMA STO LABEL "APOTELESMA" GIA TIN EMFANISI TOU APOTELESMATOS   
LOGIKO_OR_a:    
                      PRINT 'LOGIKO OR '    ; EMFANISI MINIMATOS   
                      OR AX,[0202h]         ; XRISIMOPOIEI TIN PRAKSI TOU LOGIKOU OR GIA TO AX ME OTI IPARXI STI THESI MNIMIS [0202h] KAI TO APOTELESMA APOTHIKEVETE STON AX  
                      MOV [0204h],AX        ; KANI ANTIGRAFI TO PERIEXOMENO TOU AX STI THESI MNIMIS [0204] 
                      RET                   ; META TO TELOS TIS IPOROUTINAS EPISTREFOUME STIN AMESOS EPOMENI ENTOLI APO EKI POU TIN KALESAME  
           
 ; ( 8 )           
           
LOGIKO_XOR:                                 ; ERXETE EDO OTAN TO CX INE ISO ME TO 8  
                   CALL LOGIKO_XOR_a        ; KALOUME TIN IPOROUTINA "LOGIKO_XORa"  
                   JMP WYNIK           ; KANI ALMA STO LABEL "APOTELESMA" GIA TIN EMFANISI TOU APOTELESMATOS   
LOGIKO_XOR_a:     
                      PRINT 'LOGIKO XOR '   ; EMFANISI MINIMATOS        
                      XOR AX,[0202h]        ; XRISIMOPOIEI TIN PRAKSI TOU LOGIKOU XOR GIA TO AX ME OTI IPARXI STI THESI MNIMIS [0202h] KAI TO APOTELESMA APOTHIKEVETE STON AX  
                      MOV [0204h],AX        ; KANI ANTIGRAFI TO PERIEXOMENO TOU AX STI THESI MNIMIS [0204] 
                      RET     
; ( J ) 
             
WYNIK:         
                   PRINT '-> WYNIK: --- ' 
                   CALL PRINT_NUM                   
                   PRINT ' ---'          
                   GOTOXY 1,18                               
                   PRINT 'KLIKNIJ DOWOLNY PRZYCISK'  
                   MOV AH,0h                         
                   INT 16h                            
                   GOTOXY 1,18                       
                   PRINT 'CZY CHCESZ UZYC KALKULATOR PONOWNIE?' 
                   print '     '  
                   PRINT '1=TAK    2=NIE'        
                   GOTOXY 1,19                  
                   PRINT 'DOKONAJ WYBORU: '     
; ( K ) 
  
CHOOSE_FALSE_B:    
                   CALL SCAN_NUM      ; DINI O XRISTIS ENA NOUMERO KAI AFTOMATA APOTHIKEVETE STON KATAXORITI CX  
                   CMP CX,1h          ; SIGKRISI AN TO CX INE ISO ME 1 TOTE EKTELITE I AMESOS EPOMENI ENTOLI IDALOS AGNOA TIN AMESOS EPOMENI ENTOLI  
                   JE AGAIN           ; ALMA STO LABEL "AGAIN"  
                   CMP CX,2h          ; SIGKRISI AN TO CX INE ISO ME 2 TOTE EKTELITE I AMESOS EPOMENI ENTOLI IDALOS AGNOA TIN AMESOS EPOMENI ENTOLI  
                   JE TELOS           ; ALMA STO LABEL "TELOS"  
                   JMP FALSE_B        ; AN KAMIA APO TIS PROIGOUMENES SINTHIKES DEN ISXIEI TOTE EKTELITE  AFTI I ENTOLI I OPOIA KANI ALMA STO LABEL "FALSE_B" KAI KSANADINI O XRISTIS EPILOGI  
  
  
  
       
       
       
       
       
  
AGAIN:       
             CALL CLEAR_SCREEN 
             JMP START         
   
  
  
  
FALSE_A:            
       PRINT 'WYBOR JEST ZLY'   
       GOTOXY 2,15                                    
       PRINT 'WYBIERZ PONOWNIE: '                   
       JMP CHOOSE_FALSE_A                              
                                  
         
  
FALSE_B:                                               
               GOTOXY 1,23                                  
               PRINT 'WYBOR JEST ZLY' 
               GOTOXY 1,22  
               PRINT 'WYBIERZ PONOWNIE: '              
               JMP CHOOSE_FALSE_B                          
     
  
  
   TELOS:    
       CALL CLEAR_SCREEN                       
       GOTOXY 3,1  
       PRINT 'WYLACZANIE PROGRAMU'      
       GOTOXY 28,4                    
       PRINT 'ARCHITEKTURA SYSTEMOW KOMPUTEROWYCH'                    
       GOTOXY 28,5                          
       PRINT 'FILIP KURZAJ'    
       GOTOXY 28,6                          
       PRINT 'NUMER ALBUMU'                     
       GOTOXY 28,7                           
       PRINT 'KLIKNIJ DOWOLNY PRZYCISK'
       MOV AH,0h   
       INT 16h     
       PRINT ''  
  
HLT     
  
DEFINE_SCAN_NUM               
DEFINE_PRINT_NUM              
DEFINE_PRINT_NUM_UNS        
DEFINE_CLEAR_SCREEN        
  
  
  
  
END         