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
CMP CX,6h        
JE LOGIKO_AND
CMP CX,7h      
JE LOGIKO_OR    
CMP CX,8h    
JE LOGIKO_XOR
 
; ( H )  
 
JMP FALSE_A 
      
  
  
; ( I )   
  
 ; ( 1 ) 
  
NIC:                                 
                      JMP START      
                     
          
          
 ; ( 2 ) 
           
SUMA:                            
                   CALL SUMA_a    
                   JMP WYNIK    
SUMA_a:                                   
                      PRINT 'SUMA' 
                      ADC AX,[0202h]    
                      MOV [0204h],AX  
                      RET                 
  
 ; ( 3 )    
ROZNICA:                                
                   CALL ROZNICA_a        
                   JMP WYNIK      
ROZNICA_a:         
                      PRINT 'ROZNICA'   
                      SBB AX,[0202h]  
                      MOV [0204h],AX   
                      RET              
 ; ( 4 ) 
  
ILOCZYN:                            
                   CALL ILOCZYN_a    
                   JMP WYNIK       
ILOCZYN_a:    
                      PRINT 'ILOCZYN'  
                      MOV BX,[0202h]        
                      MUL BX               
                      MOV [0204h],AX      
                      RET                 
            
; ( 5 )            
          
ILORAZ:                            
                   CALL ILORAZ_a
                   JMP WYNIK  
ILORAZ_a:      
                   PRINT 'ILORAZ' 
                      MOV BX,[0202h]
                      DIV BX        
                      MOV [0204h],AX 
                      MOV [0206h],DX
                      RET         
             
 ; ( 6 )            
             
LOGIKO_AND:                        
                   CALL LOGIKO_AND_a    
                   JMP WYNIK       
LOGIKO_AND_a:     
                      PRINT 'LOGIKO AND '
                      AND AX,[0202h]     
                      MOV [0204h],AX    
                      RET             
             
 ; ( 7 )            
             
LOGIKO_OR:                              
                   CALL LOGIKO_OR_a    
                   JMP WYNIK       
LOGIKO_OR_a:    
                      PRINT 'LOGIKO OR '  
                      OR AX,[0202h]        
                      MOV [0204h],AX      
                      RET                
           
 ; ( 8 )           
           
LOGIKO_XOR:                                 
                   CALL LOGIKO_XOR_a   
                   JMP WYNIK         
LOGIKO_XOR_a:     
                      PRINT 'LOGIKO XOR '     
                      XOR AX,[0202h]      
                      MOV [0204h],AX    
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
                   CALL SCAN_NUM    
                   CMP CX,1h      
                   JE AGAIN       
                   CMP CX,2h     
                   JE TELOS        
                   JMP FALSE_B    
  
  
  
       
       
       
       
       
  
AGAIN:       
             CALL CLEAR_SCREEN 
             JMP START         
   
  
  
  
FALSE_A:            
       PRINT 'WYBOR JEST ZLY'   
       GOTOXY 2,16                                    
       PRINT 'WYBIERZ PONOWNIE: '                   
       JMP CHOOSE_FALSE_A                              
                                  
         
  
FALSE_B:                                               
               GOTOXY 1,22                                  
               PRINT 'WYBOR JEST ZLY' 
               GOTOXY 1,23  
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
       PRINT 'NUMER ALBUMU: 102520'                     
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