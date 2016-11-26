package administrador;

import static java.lang.System.out;
import java.util.ArrayList;

public class FormValidator {

    
    private static final String[] rulesList = {};
    
    private ArrayList<InputRule> inputsRules = new ArrayList<InputRule>();
    
    public FormValidator() {
        
    }
    
    public void addInputRules(String data, String[] rules) {
        
        InputRule inputRule = new InputRule(data);
       
        inputRule.setRules(rules);
        
        inputsRules.add(inputRule);
    }
    
    
    public boolean validate() {
        
        for(InputRule aux : this.inputsRules) {
            
            if(!aux.validate()) {
                
                out.println("Un objeto tiene fallas de validation");
                
                return false;
                
            }
            
            return true;
        }
        
        return true;
    }
}
