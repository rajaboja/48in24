Imports System.Collections.Generic
Imports System.Text.RegularExpressions


Public Module MatchingBrackets
    Public Function IsPaired(ByVal input As String) As Boolean
      Dim allowedSet As New HashSet(Of Char)({")", "(", "]","[","}","{"})
      Dim clean as String
      For Each ch As Char In input
          clean &= IIF(allowedSet.Contains(ch),ch,"")
          clean = Regex.Replace(clean, "(\{\}|\(\)|\[\])", "")
      Next     
      Return clean=""
    End Function
End Module