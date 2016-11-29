package administrador;

import java.util.ArrayList;

public class InputRule {

    private ArrayList<String> rules;
       
    private String data;
    
    private ArrayList<String> messages;
    
    public InputRule(String data) {
        rules = new ArrayList<String>();
        
        this.data = data;
    }
    
    public boolean validate() {
        
        for(String aux : rules) {
            
            if(aux.equals("required")) {
                
                if(this.data.equals("")) {
                    this.messages.add("El campo es obligatorio");
                }
            }
        }
        
        if(this.messages.isEmpty()) {
            return true;
        }
        
        return false;
    }

    public ArrayList<String> getRules() {
        return rules;
    }

    public void setRules(String[] rules) {
        
        for(String aux  : rules) {
            
            this.rules.add(aux);
        }
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public ArrayList<String> getMessages() {
        return messages;
    }
}
