trigger UpdateLastTicketDate on Support_Ticket__c (after insert) {
    Set<Id> contactIds = new Set<Id>();

    for (Support_Ticket__c ticket : Trigger.new) {
        if (ticket.Contact__c != null) {
            contactIds.add(ticket.Contact__c);
        }
    }

    List<Contact> contactsToUpdate = [SELECT Id, Last_Ticket_Date__c FROM Contact WHERE Id IN :contactIds];

    for (Contact con : contactsToUpdate) {
        Date latestTicketDate = null;
        for (Support_Ticket__c ticket : Trigger.new) {
            if (ticket.Contact__c == con.Id) {
                if (latestTicketDate == null || ticket.CreatedDate > latestTicketDate) {
                    latestTicketDate = ticket.CreatedDate.date();
                }
            }
        }
        
        con.Last_Ticket_Date__c = latestTicketDate;
    }

    update contactsToUpdate;
}
