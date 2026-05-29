class List
{
	var head: ListNode;
	var tail: ListNode;
	
	var length: Number;
	
	function List()
	{
		clear();
	}
	
	function append(v: Object): Void
	{
		if (length == 0)
		{
			head = new ListNode(v);
			tail = head;
			
			length += 1;
			
			return;
		}
		
		tail.next = new ListNode(v);
		tail = tail.next;
		
		length += 1;
	}
	
	function remove(v: Object): Void
	{
		if (length == 0)
		{
			return;
		}
		
		if (length == 1)
		{
			head = null;
			tail = null;
			length = 0;
			return;
		}
		
		var prev: ListNode = null;
		var n: ListNode = head;
		
		while (n != null)
		{
			if (n.value == v)
			{
				if (n == head)
				{
					head = head.next;
					length -= 1;
					return;
				}
				
				prev.next = n.next;
				length -= 1;
				return;
			}
			
			prev = n;
			n = n.next;
		}
	}
	
	function clear(): Void
	{
		head = null;
		tail = null;
		
		length = 0;
	}
}