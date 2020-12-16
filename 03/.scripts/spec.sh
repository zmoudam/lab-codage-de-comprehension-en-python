#!/bin/sh

# --------------------------------------
# Spec (test) specific file
# Use this to customize the testing files
# code:
# --------------------------------------

generate_spec () {
   FUNCTION="exo_03"
   PARAMETER="( [ 3, 5, 7, 9, 98, 13, 24, 56, 17, 9, 8 ] )"
   RESPONSE="[8, 24, 56, 98]"
   FILE=programme
   echo "import sys; sys.path.append('.') # Rajouter le repertoire courant" > .scripts/${FILE}0000.py
   echo "import pytest" >> .scripts/${FILE}0000.py
   echo " " >> .scripts/${FILE}0000.py
   echo "@pytest.fixture" >> .scripts/${FILE}0000.py
   echo "def bypass():" >> .scripts/${FILE}0000.py
   echo "   from ${FILE} import ${FUNCTION}" >> .scripts/${FILE}0000.py
   echo "   return ${FUNCTION}${PARAMETER} " >> .scripts/${FILE}0000.py
   echo " " >> .scripts/${FILE}0000.py
   echo "def test_answer(bypass):" >> .scripts/${FILE}0000.py
   echo "   assert bypass == ${RESPONSE}" >> .scripts/${FILE}0000.py
}
