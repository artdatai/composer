ME=`basename "$0"`
if [ "${ME}" = "install-hlfv1-unstable.sh" ]; then
  echo "Please re-run as >   cat install-hlfv1-unstable.sh | bash"
  exit 1
fi
(cat > composer.sh; chmod +x composer.sh; exec bash composer.sh)
#!/bin/bash
set -ev

# Get the current directory.
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get the full path to this script.
SOURCE="${DIR}/composer.sh"

# Create a work directory for extracting files into.
WORKDIR="$(pwd)/composer-data-unstable"
rm -rf "${WORKDIR}" && mkdir -p "${WORKDIR}"
cd "${WORKDIR}"

# Find the PAYLOAD: marker in this script.
PAYLOAD_LINE=$(grep -a -n '^PAYLOAD:$' "${SOURCE}" | cut -d ':' -f 1)
echo PAYLOAD_LINE=${PAYLOAD_LINE}

# Find and extract the payload in this script.
PAYLOAD_START=$((PAYLOAD_LINE + 1))
echo PAYLOAD_START=${PAYLOAD_START}
tail -n +${PAYLOAD_START} "${SOURCE}" | tar -xzf -

# Kill and remove any running Docker containers.
docker-compose -p composer kill
docker-compose -p composer down --remove-orphans

# Kill any other Docker containers.
docker ps -aq | xargs docker rm -f || echo 'All removed'

# run the fabric-dev-scripts to get a running fabric
./fabric-dev-servers/downloadFabric.sh
./fabric-dev-servers/startFabric.sh

# Start all Docker containers.
docker-compose -p composer -f docker-compose-playground-unstable.yml up -d

# Wait for playground to start
sleep 5

# Kill and remove any running Docker containers.
##docker-compose -p composer kill
##docker-compose -p composer down --remove-orphans

# Kill any other Docker containers.
##docker ps -aq | xargs docker rm -f

# Open the playground in a web browser.
case "$(uname)" in
"Darwin") open http://localhost:8080
          ;;
"Linux")  if [ -n "$BROWSER" ] ; then
	       	        $BROWSER http://localhost:8080
	        elif    which xdg-open > /dev/null ; then
	                xdg-open http://localhost:8080
          elif  	which gnome-open > /dev/null ; then
	                gnome-open http://localhost:8080
          #elif other types blah blah
	        else
    	            echo "Could not detect web browser to use - please launch Composer Playground URL using your chosen browser ie: <browser executable name> http://localhost:8080 or set your BROWSER variable to the browser launcher in your PATH"
	        fi
          ;;
*)        echo "Playground not launched - this OS is currently not supported "
          ;;
esac

# Exit; this is required as the payload immediately follows.
exit 0
PAYLOAD:
� �9Y �][����3��:/��3����T�榨� �x��wo������d.��8�agW�R	J����^�Z��7�'��ʍ��4��|
�4I�(M"�w���(J�J���I��R#?�9����vZ�}���z��/�{��
����O�ih/�{=��ه����Oc$Zɿ�&��3����!4NV�/o����;�������_.����^q|�N�\������/���u������O�H�������Ӊ�ag���=���N�O��b��R���;�ԞG�����{�������O�N����G'�)�-�:ASv@ ,и�`.�P�.J(F�Gz7�g��
?G�0����>��8��ؗRF�����Nl�jM�>��t��Xk�֩R�.4Q��vO��M
Zy8�XOP�Yǳ�>� �8�0��(��!q��W��B���f<�-�Z6�`۶�17�ij��ɗ޲���f�V_r̹�4p�N�#ڃ967�hk�� ����V��(A��f)����7��XQ^z����S�����h�t�t�s���IU�)�(��\�^'~�������'�����e����Eݐ%�/���e�i�<p�!�e���,%>���-3�x�\���2@���d>��4M 3.T�,�x�LMk�y�DC)nЁ�sJ[ä���nD&�!N;�q;E`�F�{��3{�Μ��+�9�x��n�\�sv?>�;� =.TM(���Q��F�N�$"�J��Q�x$rqNޫ��s�%���-�(�i*;� t�|������i,"om졸�f`p.s�,ʦ\Í���-�ܷ
�@��Y����_1��㡹7��R1���)n�M�'
�N_

�8�WňP�<�9���n$�)a7�a/�-��bc���9}���)�h'�rVr�P����]i�Y&n��Vw�t3עf��)�8>�'�"�xy2�S4�E������3���'�+K
P80y�(r�r�,��t�1)m�&Fv��Ê	��R=0�6H�\�h�D�i��&C!J !P�/k<y:9�����	t	#.b�fu0���n����ڹr�Iڒ�hj�x1��C&K f�ȱh�sfы��(�e��F��=3��/��l������D��_>H���?�^��)�cD������_���L���7s(<:��P�қ�]���O�������:6K}o������`p�{�i2����U�>2�2<�$�zo*ͭ��3A>���w���]����t�x�͆�f2o�z�D���D!P����]�p�r'�v�Ʌ��'Zט#m�G������O���@��%�s��8m�<	�Th �	s@΁ ҳm��-LC^���Νp�n��3Զ��$tpaA�ܠ�w�=Ο��={2hBU'���F�����z�_@�I���u���N�,�Ҳ��h�����j*8���1���Y��e�$d��9Ɋ�����O�K�ߵ������B*�/"��9�_���cH������+�����\{��?���?��_
~I����U�/U�O����Fhsp�<��)�r	�i�)�!	�\�(!�i�d0�v<�tQ�	�����P��_��~���H�����d$�e���,���[�j��Z��P6m-hS���Zv�)���3�:VblRzw��xn��E���uVz:��)K����ԍp7��A*�D������8�uY����G�D�ˁ/Ե*��������?U�_)�(�t�Z��RP��U���_���.����?��������CT�_������#ü�ީ��.Yo	$��s�H<�3�H'B�~Ĩ�*�#F};��rd��A��`� �Ź���^����I���:��2��4]�!�l��b��p��#v�D���[�NeM1GkH���5q"5q1u{W���~o�yl��W��1ڦy�i��}߁��{o��]~�-C��e[�*�ቪ{�p�c�0<Z GZoi�rf�m qyQ��+ ��s�Ќ�\�A����}� ����堛��>�u�^��[��kSR�G�D������:��u�E��`f����d_��8�#�f5�7�~�&��� 7ؽߤی�	��97�~&׵d:\M�6��C%�u���|����?3����."�ψ��+�/��_�������o�����-�.�Ǫ��Rp��_��q1�cAT񿥠����+��s��w��C�Ƕ �g�*��\��c�^8���`h@��C0���xκ��8�0l���0��(͒$eWQ~�ʐ���(V���W.��S��+��JU,o86'��t�lc�=GZu�-���=yA
/����w�<��i%���䎢�$���x5�`O@��嘱U��v���u{b"�4x6���MF��sJɩ�nV���n<��q���o����t��[� ��'߹���?Z��].����˔���?nZɿ�W�N�~|Y9\.���J�e�#��R:�����������?�>������2�)��p�Y�X�ql�t�b)��(�s	��l<!p�u<�Y�	ǷY���j��4�!���p��U��|>.X��"�?��%�a��bB��vK#�Ļ���Jw�4Q?_����Є/�u�]q��ϥ��
t��yԘ	��G�׌�8��C0�2�v;Dت�L�5Aut_$�=��z���n|��)��MW�_)��?�$���1����>�4�_-T�L�!�W�?����c�O�x��]
^��j�<�{�W�@��8�Z���� sߐ���g��%	������q����r1��Zo�H_������ޜְ�Aw�`���4���i疉��O}vJ��y�Hw�m�=���o��}�؄q��1r-��f��Ex�p�LNp�ɬ'��x��bs5�9jo�EsI�٠��`�uF9��z��2<�Q&�=����D�:���6�s.���g ��ݚ�r�kg�&���t�*�)�sj�N%��ǆĭ�0����@ u�3"�mo�ey�����n7�n�����9�ۻ����=��"�v6�8�9g��r����b ��P�0�)��v���K4�[�3ۧwKkUׇ��9^(i��Ń}��)��?ET�)�-�
����	�3�PZ��%ʐ������O�����R����}�Ǹ0l�^�-��If�����,�#����{C��<3���#� �Kyk��I����5`�5M|��?�O�=x!Lbl'�����>���$���ld�l�k��e+=5%���ʱkiBÐNe3&ɜ��ep*7<��k����q�W��k�����9��Х��cs �5�͑��hmւg�.��}{��Y#Yͥ.���d.���j�l��;�j��7|��N�aFHt��*�>=l<����O����� �a�cT�W
~��|�Q����Ϙ����?e��]��Te���j��Z�������7��w�s���ad��k9�\��[w����U�g)��������\��-�(���O���Rp9�a��1E��"Y�eh��(�	�	� �]�}�pȀ�� �}�r]�q�v���P��_��~��BW�?������Lɖ�þeN�6;}�!Bs�m�me�E��#mѢ&/���hN�m�`]	otw�K��#`����;VaDI�1�ַ����0�k�d=�(G��b(���:�b��W�?��s?-��ę�����G���/�U��([?�
-����e~���~���\9j�id����d������b:��N�+���c���B��k��^$������2���Ej���8]�oxp��*�7�_���zul���~���:�~��I|=��ӹb�F���Z�&�+����kԎ�]׮�3��Պ`��k����~h�:����ˮ�;�ծ��)�����$��v坺`/6������Kvu��֧����ڞ.��fiGŨp훻�AE�[[�v�<�|W�ʰ��v���ꂨ��MCTEtn:r�U ���C�O^�}<��"ͮ��(�תJr�#��Q����8���G�v��}��]t�~O�u�?(��Z[���-����`{�F�S���g���{�yˤ�>��zqo���3��z�T��bw���Wӻ]��o����������3�X���-��jck����<N��ex�Mӯ58N�p'�zg����d�\*������ÓO4a���"D~��j��Ծ���}��?���Y����?V��Wtñ�E��������w�F���Y��{�@�Uő�m�n�ǧM��3B�+�Ʒ�r��
��$����N�t��ϖ�u�p��~��q[L������lW�>����ٻ�e����;��/�d�e�Ml��������Bb�������[BB�6NL<3�,�^����U�f��P���C�4�V�Z����rg?P�LDѽ�v�q|ut�wX/�h�'���'As�A[�O[�C��,4��y ����,�"=P8<��r�0�A�-ϑ�M3� Ģ��>�5��<�A 
��:+d����  .D�6��,��ᑗg`�#t��J�D�~F���~׎�P���v��������AF�;A��RhOr4��.�sX	�c��Ƥ+�B>�#a.�R�1�y���Rp;|.�J���0
Q]���C�*�yQMs��4��F�(y�h:��p�{��-����>N7Cp��W���7�����kN�E���΃X7=5ҤI�4]�j��vv;[��%X���׾dY�>&��[ntW���G�\K��ѿz�Z�TƖ>6�[�R �h\�B)��m��<�9jɦ:B�q�dd�!7`���l�((���� S�����0��z}�Izr
���eQB�4cr!�vGe(d��L�~c\�@�Pwr��f�f�:P�15�o�d�o�w�2�3q�C�� ��dD��K(��F��!K��A.\dko�ll0.Zi���P�>;=��}:Cq�
�P�9�
��Ejq�rϓ+7_��~��K� .�TV*`�b�-�xb1>�al�׏^�^��
����J9:�]�;�	=���w��m��o�_�|v#����YF�����O�U���A+f�ì|X�0"�y>���3�a,�֦�.i.��͛��h�~� z#6{����̆���`�#��W�?-%D��b�u͐n����[y<���<��
��&x~���r���]Jx�?���g��5�Y�cʔ�JYa�j"��_+���U���Z���|'kq���d4V��*����8�w�_Dq�{������z�c9���gs�n&<W�����s����/%,������-q��������������~�ڸY�SM�&�4s��LU���i����Y�&)z�e�L�˶Ne�4aB�^�mÜ�cxF���=v�!0#��g�5Ɇ	-�Xl�)_�J���&a�N<<R,���c�d��<���_�h8�@�F������J&b�������ϭ��,%����8@
��Ѯq����&?�1�l:$� c���ǹ�Ƃ;$�#,���T���V�� ��QX�ܤC�r�2dI�C6��5�$e���e����t�:5k�Bl��e,�f~A�0Ss+�ZD7�D֨�/>�Zh���$�/<2�s�B�����|1���_W��E����Rp^��>�Ǎ$�b� �M���\3hǢ��ן8���/���� ����<���3��=P��]�5�p|��lLB6U��2z��,2P������8��L���4,�z��pv�|ڹr�r��I&rҝa��Ĩ<0�O_����,�����;�&��H�m�*��Pu$v��B�2�B�ϻ�*���\}�<�����ܿ�/%|3�/�Ԁ�2���p�"���F��� ^�� ���(Y��ￓ��.��RNS �=�7 #7�#�ʿ�p2�@en ����b_Rlx��Y�Mꈭ������ ��-ߨ��@�f�o�va����������񈟾�5���s��wb |�"^Ⱥ�8�''�9H���@��u�qQ��[2�,ҥ`���+�f����2���%\���X�Ǔ��y�����
����R�3��c{��#�?�6s3�_�o��XJ �K~!��Lu0����1T*�$>D�:9�I�)��")����J���ıp�C�>z+ӑp�̺�"���jA%�4.���<�MpJ��H$�bna0��qZb¦���x6+sب�[�z*���Y�3l�E�d��T!�	�F ��ga�4&��R��M�`l�x�h�XF�K&E2�j٦�u�@{��A����$���m�h�	�u�u$r�����\�OO˭N��&G��zԪ5:��|�%��%9h�j�Bk���XSŖ�
k�6�������M���ԧ�o�gB09C��\dG2�:Tm~�&\/d���صX;�N��i�:���wn�&�=:�ixwɟ��ݴ��O�Y���x�}<_���<�0��@i��M��.Ě���aY ��"x�����W@<��p�Ic�p��l���p��Q�/�<�W�Ÿ莦q��핪bt�?�"�A�h����$f\&�'�C��2�i���3	�t}j��d�o<�A�k�$�?2�l��7��e�Sow������4@�<H&l��)��3���Ir�k���Ӓ�T��] �$jVEI^]�ťuMʯ��m֢��XC�"�8�e���*k᐀<��  қ^
���
2	)"h@��t���"{��sM;�kc?h|N��o>B��:��G��_�
�����I�4$_%}r(���X�	�g¸�
�z�z���a�st�&H���%��ZDC�~���3��*L9���=�b������x��=-�* �LF|����
����؞ ���/�ԙ�@t��=!Tx�yҐ��1I!��V<��tj�u����{���J��o�2�dK��g��.
�@{���j��j�5>E�c���z��=�D�ki�h6�F��zk��'p(��a�D&`T��C���#:L�\Q��',KKٸ���N�m2U�BA?�O	�
�1c�s�^���M4O����f�_�5���>\l�O�y"�ܤ�\Tt$�	���_sP���4L��xEl�=IB������x�Zs|{�
	��ݻw$;��-�XXT=y?� ����WL�d����O]�A�sz�X��v�;���f����9��y��4���H|���F�T꧌�=�?k�)=&13��!�_^��i�(�	r����g�X1S<j�|�[r([JN�C�.y�'3�|L��L�4V��K���ڸ��i��AمH�[�&��t�������:?_���:C�~?����8��ɛ�����<���&��&3��H�cf�����ڵ0"9KD8�7���)S�-���Z��Y���G�=D��#T���6�mC)q1�y�u(��x%���A�$	��ٕT�Oyo��Q�q-�D�ßi˖�k������PǙƘ�[����2�DF�Q{> ��3���{��D{�SR'mrL�H>����_��%;��h�Dڧ�gܤ�~İF�l���N�c1���F���Cu Z�]Ϛ:A@�}�d�G~�{��#��P��竨��7(NJb�ѓ l�%�	�j�!�7�/��
뮯�ϥ� ��J&3+b�m�膛+�L~�B��:��<Es�lZ������B��
0K���Q�mv/�뿾�������-������F1������5�&�_=`�-߼q�5������ωo�k��<,��lS��fF?��9حS��w��zh�ed��s���~�"�t�Oc��Y����W�|Ƴǿ}��HO{����b�0����,���2>���;���F�")2��n�i�RtX��#����T��T*Ƀͳp�J��T�\�R���'��Xl�(S��BԤ����
#%Y��Rͷk��6�).����n���y;c�����Xu*<��/�_D���Z��g�J!�2�>2�^j�ox��͏0?_�y��s�s��R�6_k/��4��{��X�Wh|L�؟⩖ߓ�4���	l��9JU��j�ZeRVH]��*��k�z�_B�f����[Җ�#�B�W7I'`i����B�Ұ�50M���R�S��R�^]�vG�0�$bS����i��I�[������{K�^��E	�4os�4�Q�Cu�����j���do�f����32^�{���Һ�Z������Ul�iŠ�^�Fm	|�]5Qz&|~R���{��$�;Sb�Ms���6>4�%�?�$��Ֆ ̞z��9#C名J����@'�54��"�!3�/0��`��k�3$��c�@4Ddx����]R"�3=˲��2}��5��d�M�@َI����-�x:x�~]�T����
�< ߓ���=o �̵���-+�'��?E�b�hjjה�	v�cM�� d��,.��0��K� 2��$@_�T�I�䋛�Է�Ч7tB�2j�4z\	q����W<C�%��8�6,0���k��
�?��peLKa�H�B�Ϭ�&�O?�B�W��υ�^��wtW��WC.e���7㱿�'p�?T�b��Cp,������i��i}҇?��.��b>ng˰�����a�6���N��Ѓ�� '�7�7Q�<{D%zk���>���JvñaB���p�ܼ"�1�eȽNː�F�0[~eV�!d�+˰�u�0�����yE6_n��^ų�޺���[�--~\��$`�����&���7$lR��#�8�Tcז�K�/��ŗB��#oR,N�'�; h%�9����n�P�I��A��gɤ$n�g�J��R�Z�7���p�eE����_��r��X�[�����BJC��eF��F�ؽ�.���lv%��D�X��aT<"�bvh��;�
�m�p~[�AT�e٘a]?�%BF��y�4yY 2s��ҭ:t�Q��6���  '�	b���[���ؔ��L���r��|��o�c~�n�`�!T%��LE�
����`��Ҭ��;f+�xUdF������#e7���6d��>��_pdօ����	�͋M�ë�A��<9-r����\1�k4 ��ZL�Y��	LǙm�}�T��|�ZGp���!��{�@7젻��Aco��dw�S��y)���J�{MB* �����UYI���'6�0Wt|���.����g��g��c$�E]��R��)�R����;�Go�~Sx��`b���������������x,����\��2����d��X���|�{��/^����=������K	�L:�CC�������c}=��Ǟ�����6�����'��Ǜ��{,�/^~���G�w�a�����+�_Bx����a�����wKke^GxU���� ��Z��K	���[�0�o�����nn�
�\~C�mJ;���6�;�_w{ckS�mdw�������w���Mړs�^.�U�Q�ʕ�R���
��������0���^JHa���-R���er|�8/w��~��b�}�Z>��Ճ�������n�����dG��t�P���+��ry�N�d�N�zrg���j�Ͻvsc'V������I�\������e�����^c�~R�����y��ȹ��������5��+t�̛��I�:ݹν��+��>x���6?���[GoHj�ݻ�ުͫƏn�W^���mm��qe���m��C5�ͯ��5����m�_��s����R��7!�_�#:��m�O�`���(�����������Z?�4vU�6��_�Q��T�e��_7*�~㤩�VG_����E��s��o�o��*�����/G�''��J�yb�cՓ�����^}�����i�r�^�4N�t��FG���E�r��*���Y~�i�?Nb��/҇֗�]��Y��͆�w���;��w��z�|\��+�f��_�>~x,��fe�C�֩��渉�w�����i@\cҺ��Ɨ��a�|�%4������]�4�)�;��֠������tQ���R>�ir�vijeO�:�y��2��I����X��qm�ڥV�/�'��{�٩|lV�{�	�6��u6���/0�.g�J���Í�A5����]�?{�ڜ��m��W���N��l06�Թ���7$df��6������W���GOwrO����%����-iio����W�>�T�RUq��B�,V��Ak���E��	d�Ө\ъV����$�U��0�w�����1=��q��R����\.ꊰ˽)ۉuP��l��z�v���d�Ȭ̱f)j�.�m��D�e;A��_����nY2�颵+�]{X�ΤU�T�{�h��O�@W�,a��8�.O`z��vŅW���"R�"Gh�`:��h��m����*�F$Y�b��+��0�2w���J��+>�wVr:��G=�ȉ'�/F��g�y���d
/�?
�����������" ��s�i��|���E�F�\���\G{ B*����@��9�3�_��_���g�҅�Ф��˝i��$�������_���1(�p�(��>��;�,m�4�{T��qQ�g�>1i�x��M2�2�3}�6r;^�k��Jϋ꠽,R���D��Y���T�J�=�M�ek��\'� fᢗ���d�p�R4�v��wK�m���)l$F���pl��XjDc��L�8q�vk9��"V`�do@�k[�0��N#R�Iy�/��ZY*b;-'����|s��ٽ3R���ՒX�����Ϋ�Bs�,���(3�:�3���:l�Yn��6�T�����a��Zs��U�O�W�{��=hT{l���TA�ToYb������#�ɼ��O����������� ��s�i��<������	��t�����G��:�G����������C�?.���y������Q���#���\���#]H���߳#���\��`��ZЈ���Z�5J!�!��)��ke��������R^ST�.j$I����%H��/��qA�!��D��`�qFT��۱���]s�%�~�aF�\ɢM�����x�ձ7X��$הf���Ir�!d���϶���ٓu����P~e*�x��Kή��D�sZ�\���bh�.���^�a�G�?.�s��(�G����Ͻ����Q������JR����.��z�=����A�?��w���H������4�?��q9\���\G{ B*���b������c[�^��Zc��.7^���#Β`��q�j�5��-5��G��5k`��شv�ND�Wη���ߟ��S�xM�H~�֓
���ab��!��'��6�ü�U��D
��Ĉ��(���O�y����!K�"�Aѥ�\��h���x�{T��v��i9������؋�r�e�U6��U�$�<`�;�@@����ʉGT1�;�pHb�S���Y6j$C�ߍ$����6�R���B�l��\kk�N����ߵ�Bt�U��;���z�Xɪӻy��`��Rڍ0�)�����+L�hE�Z��wB��ʼT-o��(�u�ĺ�g���T�t=�ni��Ҳ���x�V����ϑ�����m������?����G�?.�K�?:�OR����������t��y�>��5%q��n����gA���r�������������������������k�����S�<����΂^���RT���j)O��A�T���$M=_(k�fj�(�)�H���Z&L�h�I�\,�
����8G����{-�G��쿳��?Z%�-���%�����D���t�<�jeٮ���vב�����$E�U+r�F��AE���'�������.�m�k����Zg��X�#�ݜ%�|�֣;����#Ú�rDo6S��x/�����u�NO�����c�O�/��y|L�?^$s����h��,H��O_���⿞?����G�R�s�����"`�?���4�� ���A����O.��%њpi �G�q�'_y���<.���sF�����O�0����G��@������;���e�`�D����r^U����L�Z�&t�*��7u��
����P�J��J�T6HtP�>����v�����o8�m=�ak�c��<�=z3�4yΖ�M�e\�5҈���.����LO[rj�ד�'{��4K"7�W��N���@�ͥ]�T{c��/�juC�V&]�������+é�C��F��<����"���t\x�G���0������T��A������'��m��!�I���E�$��x����|�K��?6w�Rr���d�ej,��Ѷ*����0���?V����/o����KU�H�/U�km�s��h�A�r���IH��q ����%��C��b��	t1M:�����Y���:�{|�N渨ųl��W+ˍ�ܘ���L�2�+�%.7��V+���d<�g�{���G�skѩ-h�3ּk�����K;澠H�{�,E����V��]b�Z�2N^_��ƈ��"�����j=9�; W����ϪX�V�յ9�k��]�)͇��d�uG��;��)��J�X\wV\�+�=}|���*�Z5V�D��z���&#k|mK���B����Cq�"�ia����]V��-kb���FvG~��T�
S�,��b0��x���9A�������{,���u1\��C���0������T�?E#��BH�����>���_��O#�����/�c�����oðP/�6�Q�&���E���_���(����ހ�do ;���80w���`�ٶ8ݵ�j�D�m[�1M|��\}����{��d���be�V�dE�P���t�uԭ�Ǌ�i�TC��x���ae��LK^�ֺ�R��:+�a���^��U�<�\G�럺����/TX��G�O4���6�$��"���I�Y��m��}���Sw�%��4��U�5ǫP�^c¶�W��pT���.�}�IV���SEK��2�eV|��m�f��P�jo��%[������?G*�?����ς��s��?���
�/���7��u��������
���_������t���O��� ��,������4��������������_(�ߙp�G�}jq.���O��?������#����?E���K�,��S
���d��K*],SZ�1Jy�HT�d�f��
D� )�h��,AkZ^UK��
��!��k��":�9����룊"y�m}d��ܨ�J�5�u�����D�h�u�������qr�̷+�j{C3/���cMj��7��Q��Gf֚��]��ș�+f�)Er��+�y�Թ�����;d�������bahp�g����y?���<�t����u��� _­g|�ſ�=��kr���H�g|���_V��|O���WS����`�/�l���ޗ�)q%a�=��:T
�vZ�I}��\A8�5�ܾZ�A�8��6�!o�(��w�D����뺘ۑ��a�C��q{���֖�?���NL���-��xЍ6Q�ԋ�>�~���'	0.�r�s����n�;��A��ڝ��$Hľ#��,x��g(��m?���:~������_�)���@���ik�"0t|� ����⬧h��>�+>C,�x>K��0×}җ��`[w�ϕ-�pC|�;�M�1pc�^��\s�c+��#;����K��2��2\5T@v���_�iF\	AV�{��DQ�Uba��o�$[�kJ���߀�������ƪ[\�@��1%�]W,� i��|;��W<p�0R|��A���*|���x�է�Ɣ����R�α}��r'j�� �c{=�5��>���|�%H���*8���%|��-P���|� �5i�����D�MD
<C�M[M[X+�2p�3|Z�{�?�أP��8���e�`E9��][��W�a�c�8X���J��ڳ��[�W`l�<�z�$�}H3�'��z��8����l.0�m��z�Ŀ(j��-�ĺ��7�3�o�o ���~r���Qtǵ���R���뫧�ߐ4 0q�=��@'g��:��bp�����,�$mr}:�߮n�[�T�� %�&~�x��j��cd�`נ� wᏦ<��lq���o}�Ut��]�
��װ�S�^\��h�B�� ݓ�
d�X������7�\?�d�.�=����>֙�q��:�ŀ>H��!��@m`|}[a����#r�A[h��=ٞ̕ǒ�W>$���C�jXx���7x�zf�]%Cm�M���h��O2�@����7�{ ��OςT^���~�j7�7*=��N2��{C���'�;�וP� �_�J�o��>)�f�E���q!�����"��T8ڹ�i�Lߝ_�2n�����g_~�8�S��hwC������I��$��'� �<c~u{����� p�+�oP� ���n��N���UbB}��?�x��'e}?���������x����V�p8`�6�������5e�A
SY9a#�6VF�o\'��.�=e�{"U����u|����O�����`�ؗ�d��n2"p�7��8�n����kn,|�q`�9�0����>�Џ������q-�Ӹ�R�B�$���>p��f�<o�)�W�Us�8��C:��]�w����Y󠬠]����������y^����q�&��3�gG�Ȇ���\���#�?5���N�^{-?mI�4���x8��(�M��>\_)�u��s�W����W'���w��(~:9ʽ��������8h�O&U���J����G��6�C�@��1P����v(#1^�}e(O���J6��{>;�#��
��r᷷�5��z�}:��
r�����d�S� A����e��b$����dw�ד���*d��������t�\��ú\�K��~�V��庺��r�7#- �Hyࢀ�Q@�"H�<���@���Ey (� �s|)�n]�;̌�<�n������9��9��i&�9�?7;�'Z�v�I�|�B��K��`=h 4E���b��}��5s��|P'�.%�.X7�Bsj�.��\u��ͥfy��E��p���m���< !�&�#V�fW��E�<w���v{lt\c��<g��UE����٘t�%m���!mN�����j�n���1T�u�i�`�ޗO�s��is��ցgkL$�L�1��p����:w9��c���*<w�'v; <;Q�Α%@��a����>�)��9bi��(*A�V+�:��偁���t@Lyb��#�r0_�No�r�Årݗ��=܆#Lo�*���j�T=��bK/�ⱑ5�8<n�gkd�j�{�*W����u�N���x�5����n���/@X�*J8}�~J�ˑ&Ea��<:�{D����|^|9�d�Qh�w�7���a�
M�Ze0�P�0Ur扵����J��l��:�N���4E3�� �]�3i_"ΖNQt4��H��4�>2q&MEϣ�`��3Q�n%Y8�e�ߟ�ѩ��[Ig�%��Pr.#��K�C�����D���5nE fxug4�e�a����\J��{Б%�g/V��f�o|Q�nH��T��G��bk}A�~(��ں�쭯L�浵��,MeN���*V���D4�O땨mFje#�T�h�O,�(���׏���z��T��A\�̦Y�m��✝��pу�e&F12��CP��Xl�(�o�5L�b)���Rh
��A�����רVV�9��e�S![f�ކ��u�L��A��	Q�$�-S�p�\F,�)���,hX��gQ]�C�*�X��,X���
�-�v0�%gn��}�Wc9>� �����K����q����)HƗsݺ���J��H3�t�
�鄟9g���2�p�I䲧^\�,="�=���g|����8S̞�{�|9&͟L����A�9>!n�C�G�]B���e�F%�0+���`��M�3�D1���#:�G����t"�T6��z�~K��L8y�H�Gc����S��s��2�K&��:��Z�7�4�U�/��PC����,�k
/�si�.�af��J�FZYAA͕��J\*+�SX\�TF���;�:z-@E@+�y��ÑQ@I��OD���(�"	���<#� ybA��	:��7P2YE��.d�t$t�TY�U��dsY0_AP0�nW�駲���0��-ZCO'rt��S[T��dL7���(u|B7hv�y���	�ʑ:J43I\t��Y��KE�͢U.S�'f��]�	�g��3ɯ���f��S⒥����K|�*���>NS/����I�~�o��v-�d���G����!��yI��KjB�N�v���p�&��UG���?��p�/2zB�:�pe��'�z¥��|V=�k�z��'�]������|��a��Ӑk��/�}Z�������;���t9���'r`�{�o������op���g��o�}��_}�_>��/�7�Gw_�;��V��(����y~����;��_���o�Ƿ�<4��~�џy�'���W�%|���1q�?��_��o�ߏ`G���������B�����-�mJ��������>O?�����wL��K��}\���tS�W�������@ːv=�iט�wM�B.�r�X+<�eۣ8�gG���k-�`L=���\���W��bA�DɅ�ꌞӢ(k��E<�!蘷aua������~�B���1��=�l6�]�g��4���N��\��Q��q��q��b-&��y�'�ʷ|�8�̈��T8F�`~6M��0S(�;�� �gۃ�6f��G*�jDh�i��8��|TIx�*�|,�/��b��/�1n�S1&G�St�X�g���Xʴ�ź5JeG��͏"�h��o�UlZNֺ�p=�X%{@&�q�������y���%%"�t�J��'�Һ�m�[7� [��-��& ��.��?������2���,l���|cW��@*e& o�Tc��W��g5?G����R6h�|X�Y��ф7�*}�[)s��H��(�tK���Ϟ�������c21�F�	d�6&���fY�� �&��$��>,��3�����Ăe�#6Ѫ�[��� xH&����H�I����DG*�f��IW��z���j2&eRR���c�1r�t'�k�*�h�B(��l-���I��+,�c���rf�憓@=P.E]\/"bӉ�osD:����|mDۋ��1y߀�VX�;��󌧘�6:_!iX�j����Ҥ�u*��	�by�(D�1���a�X,�J�LWH.���v���z��*��i�4@�C>�Xћ�=�:�Ĭ��vb�D�2�֊9�EH��}g��I�n2�I��B-as��1W�h��t�%�LX�K�e�^XZK��I�U��=��Y��4&�=>�%ꃩ��U
'��<ߥ
S���1�*�g�~|Z-��h����2,��qL�ۮ&,L#� ���eK8���5�)s)rAX�M�+�%�?$�S������8V/��Dl4��FEw�M�t=���m�	\wK�m�w�c������w9
-Ǵ�&l9HN�6G�8h��	��6f��lۘm��m�&�����Ki��e����y��w�������^�?m\Jz���
90��[ ��ev�W�e�n�B�@�����샙k���?����v?��;��>�h�{?�}���tq��_�_�^�9�Y'qc�QJ��8��&7��^�?����Fq0��^�-�5 �+��p?�14�
_���9;�x|��� ���s`ƶ���|
Y�`�Ѹt�`�߻7t��k>��g�fc]}���4�y�}�E)ɭ��?���í��n�|������F���?���uwvs�mú�ú_��S�}Bxj�]b�	�ܦz\"jy��ĳ @%����LV��S�|��'F	cF��,�xlsM�<�栱�zh�W�⡍�2h�8�k��}F3{�T�#�=��tm�>a�&���'e�׵z�s!�/�ȇ�ֈ��E��0@��r��P�8�2���"ҥ�@F�u&T0z�yǌ]�3�3]V��9O=�dK�r\p���8rd�/������՟��1�ˍ�-XwE��SHV�/�
�i�JdSq22Ά�Dj�Ǫgba\��1�f#~&PDΊ�� /�[�\p8&(k�U
��~Br�[��*���u��J�k�=��V�������^���ї�s��I�������s ���! ��"5��K�z,v��i(�
~K/0Wa#Z��Y#z�FZ�H�|"��v����n��$��;��R+Sz
>ڛ�2�3�Yv�c�����n]��3'3:�nlӏt��>ҭ�>���z�����J߷b偙"�Ǚ�#���4r(��ŀ��`��'�
ޡ=�e��39�vO�n��� 6��F� ��}�a���@7U���E�,ъ%d��j��j�r(~@�h|R�Jb����T�WO�sJ�My1
9�QDS:̄�MA��|؀ٜ�Lhz�Y[���K5s�T;<Hy�4��_�y�kŪQ�4uv%{C�X�Av	+gͶZ�k�oN�yjx�q8_��;D�^���;,xd	�����dŶ,ݛrq���Z��8��*�V9��)���u�kn������&�qi�6
��%��cۆ�����]l7��V��"h���q|��	Q6�K���&���}V-���\�C;�;�����)U�B�7^�~{Eϩ��xW�;{�����/�7��2�M�3h{N��=������6h�������������O���n�??��U�=��q���0��@��(�Z�HY#Xg ]�)]
�>Q�Z�OH��:bu ��0o�ח�AXe�����Ot��9>��(Y,�*��w�6��^^]Z�GzHM���bo��iN��:i���Y$.�~G" �$�le0;s��"1D�'�]��P�K��Z�̡��X�/j���gb��5�	����-͆4<�0�1y`���nAoBk��#�rSߴ�P�VN-+�@�	�Q4�j_5u`����C�Y�WMv�-�c�O�9j�C0<ߵ���Up:j�]Xko�E
��B
�W\�s�>$t�����A��_k{���Xa,z���@\Y���f��*����x�;���vV�q!r@Cي:��pnT�w��e��A���>��:U�WA�9�S��v ��x�M"���Of���m�k�Jg*�i��
*|��: �p�� �b� ����3r6#�҈e��> ���A�|�CNO�G�g���:�o�5��)��� I��W,�Uy�OC���K��TJ*X'�f?9��� c�������{|�ȍCpQV����R�p�ȓ���Jl��X�g��G����,PH�,�������ϫ�Z�4��&�{
�d��I RM�z*)�ȁ�2d�1պ�P��C��m��`F����������9v��YjV(�U�QC�T]Ao���Z��}}�U8AxcK�P
TǍ@*Ea�C���%�4qG3y�.)pF�`]r�X_(�`�Z�t�NJTk	�Z�σ�sr��j��A.R>�.���MH�;�Ҕŀaf<ԘF|�E7�Ь�9�%�-vJ�FQ:Vzpo9˔�0'<�?��a��L��9���A9�yr_�Y���qwa��+/�;� x��:�
;��I�������a���0�����"���>h i�2Y����f�����լ�󺺐�����x���Ϊ�)*� �^��x\�F�L��]3��H�V���eQpp���` ��l�AW�*�P����ͻ	�y.����4੣��Շ�%���@q���yT��g��2Lc8e�	@�,�B��M�y�Ӧ���J�$�n�*�H�E�&+l@K8�t1�E¦H�#�a��-�G�~ꛦ�e�/�7������9��5�)&P�@��=�bX����\c��M�Q����s�7���~"��(�>Vع�ws�(��e}~�[!k6��a�yIpxY/KV�vw����<'�۽��Qq�jV���qUI�&9g�@A�[����o���^���~��Z�7o���ş�ο��?�/�}�f��}#���!I�����?�&�o�ķI�ۄ�m��6I|������6�h�M�M�&�o�ķ1�6f{�ğP�����7I�~{՜󍿱,��1�yo���4Ҽ7y��\
��w�3$&}�����\��a�Jzٲr��Do��������+�P������C��<�b����[��v�wH�%v�$֬�!ZB�m? ��L���tVeD�������t�|qν�| �	�k�t���Gd�Lad� �i�a�OzX�rہ.�I�<@zH� ]`�8"��	E2�J>!�|�n
�s�?W��gL��=������/������	"��_��g?�����/~�����/~s�m�T�V�}�z��!.��9��� ��j�y�1�Y�A���	�8��?1��qw9�Q���/��Һ����}�Wݹ��lu��y0�����;�'���m�����O�7��o2SU�s��t��J����_� ��������n$��mb����[��VKu���w�?|�e�������Y���� �R���ݯ7��İ�����$�]f�������]�4CAE���jp��փ�o����7�Z	�~5�-�i��O9�S��"��B�t���[	�s]�cx��������ˮ{��v���l ���(���$���W��O���b�\6W�����T��+Θ�F_'!��{��������s������G�9Z��w�h�%G<_3�L�?���:�8�5�tm~k�(J��O�(��0_���۫ܬgss�k�}���6=�����]��3x���yy'V�d���Wi0�/�����������$�:�#ӟ��~<��t˭m[�{
.}s���jI��w����;K�l'��{|&�������8������. �/\������1��ñ��G`$Nz�?AR��0��KQ�?��Y�E����U8�t�;V�����ewj�<ń�r�i�S$��go�%�D��;Q�{�����`��Q�w�%�g��{=���4�U_��Os����#�R���\��l?���:��(b�&��4����X�1��[:��4�#�����L�B1A���~⽖�3�?����S��/*���'*������޾�o���)�������wt����^�������URQ�یX�p[��5��
�"V��+��٭�ϪT��Z�$|����M�R��ܨ��t���'[�ق\-K�ǻ�On��V'��ozv�B�ֽ7\At��Stzt˲"5ؚ�[�G�f���\��,��}�lz|g;{{toJ�T����=�+uo�?<�XoK���/�������zZU�Q����H��y�m{���TO����B�<��v�j{V���zCI�x�)h�شw��f�l�=�!a�-Dv�n�"'y��t������z����g��/)�-�e�"_�[�)���X�d�T�}d<�pۢج}��7d�f�rI*�>.F�ՇT*ձg��R������1���7t��e�}n]Ӿ���U�nKJ��������Xwvb#w)_*���'�x���H��i�T�J�ے�)��km��cG�AK�O r~g��"[�ߺGt���q���4{����Q�#?>"��_�����8a��/��в��"g��]����dA�G�v��|Ѻ�^\p���J�%ԙ���G�m<Qܙ�l�O��j�Hz����S���O=�B�ϻי-Uk�3��B����e�r>�"�ۭP�'��!�y����������P���D3!r�H����%�9n�[�C#�t�|�ٺ{sx��f���Ko��96G����������l��gS�W�MOqHl���ݧS�%tz�G�N���N�#:��	t�~��~Z�3!������y�1���K���0B���0���l�'�qq�c��?|������1.o�q��a���?x={Ǹ��1�	 ��RW��
��]���t�{�~[?�t����� #	��J^�|�k���c�=���׶��ގ���!�h���G(���S�1�#���@���7��Զ�/`��������� �"��$)#7,Re�O��H�q�j4N����lQ�N�:��(iZ:BX���0a��^�a}c������al��u��A�o(���"�B�Ml��%�bk����y�"��/���M���rN�Ya�8���P�u��l�T�����}O6�$��zE��Yq.Ֆ�2߲zx�&#���
����1�������LfZk�M:�ը�ق�l���Hn�MXne��9����V���v��	Z����otL��?��|>|�c���}��S׽�'�	������?��"G�����_���QjU�w�m"��c�C�GaP�3 �q�4��O�`Fm�� �B!��?
��0���ɀ��?N ��������(rb�'��Q���r�b�#G��� �}<��=7�׺�����Hl(p&Q�ܛ�,�ƅ���������n=䝖м;��w�=�d͋ÒU�S�y�w��n������Omx��+�Z�4!���Z��(/�ѓ����j��e�l6M=Hݸv8RRR�L�6�)9�y���#�K^8Ai��A\���V	����ջ�X�av��bN`�m^h��r���f�>M.��D@=%�Ҁ���B�̙�校׽�X�K{E���*V����H�h�i3�r^ȱ�bU)�Ԟ�kUJͺ��l�Q�
����cq�v�ג��,�Q�4��qL����ɛ��"�B�����O(���U�� ���_�E��
���0��"��������0��v������������?v �����b��@�#2���@�#n ��?j���!"��`JG5L�Q�00R%u\E(�r��\���I҄	�DL�$hTW5�$t�M���	1�����	�W�Nr�����[֤9�*ֲ�0�܀jSt��.?=��q��Z��bJuR��o �)�˰�g�$�L�kl�P���2'k�U]���tO4��2Y�")�$7(�C5MR��)$+@�㥈���D�p��@�#n ���~�ǁ���Gt�����X ���!��0��������^���q��߶����!*�?X� "C,������1���
[lD���W��d5�/q�.��@,¾�6=���:Q_PC�"��Ԭ	�xUܰY�O-
i�]����Z���erZZ�6�Uc����$]�茅��j|3d��pБ���f�uY�Aj�k���rmX�hq�[��ܝV�;ui-����Fv{�x����[����Х��Gˡ��r�ؕ3�#��P��yx
�m���s��D��V�i�qW������Y���!=��8�Ͷ���f=������U��RU��ceg��*��%�9N�k��C#(�(��Α�aƽ�&�SUzӀ$
�c7�85LS\t�Y�Z��*+�R�Y�Y*O��fm��uYeݓ��q�z�E���
i�x=���7�?D�?�������G� �����Ł���Gt�����\����G0��������x=���]�w���$��0��D�W����a���!��������]�?������/���ߠUB�tUG4E,��5��tS��@1F7tK��fp����؂	�A(� H�|�:�h�'���������vI�'�IQn�7��Z�Klo��ZzR��Me�)KB8����pUk;v!I�S�֛�e�VG�ͤ�����C�-弾���&B�� 76C���U�9��i��'e�\�zm���R|���SÜ>���Ǹ��AQ��
^���"��py�c���?���G��?@�5���o��)1E�9��7����#�O�`�wD���-�~E�;!z ��5�����@�#D���D� ��?j�ǐ�������SL3(n1���*��*ɐ��������j�c��[��18mY��24c"`�����/���R`�_(�`��+��ښ�D�=�yqL���|�Y�^9\ҖKs8�������N�zj�O*���E�Mn�(S�*�"�fz�FM�Ù�J���)-J��TJ��
���L�*BQS�J}��������#�9��EP��S(����AD����,�#��cD���[��BD�?'��0������{�_��X��ɶJ-ڲ�%���:#�?��>��cZ`�{�G�Y�d뻤��#�wIU�>T����vB��ց̴t ���Ku �{���j���u���{Į�{/��%�Rۜ�[����ͬ���,;��"ϲJ���m��ZxSoQ��,9�l1գ�TOcP��w��V��g�$�g
G.SKq��|�Wώ�lw�5Ɛ6TS�T�Fh�YcK~
[�B{�]�������5���p��}g� �-����5wI%���~��ڕ.�s��H��psS�,;7��rvc	l2]hĲ��f�t��zwI���U�.fY��.��}�WWIY�k�UdYX�of��f<)L����u���暵���z%ۍi�*��4E�'|O5�ը5I*׃Y�f g������E�H�?P"r���m�����u �1��kA7@�E�B�������_n�,���s,�5V�F!+uns��2���/�@�����䃾h'�\��:0�K�-��Z@Y�Uw�&>��_F/��O���]�_ז�MR�鵝^"iq�g��̬<[:�L�����ϫ+�l��3Ow����=�i�J��H�f�22O\ut3����u���P�SY�B� ����8-��Գ�*���jA	�q#�i�#�9�����>ti��0��9�lS��C������Լ4���ޟeƓ~���.�H�_��{�В
�d�$|���B&��6^ZÕ�,�������x�!b���'�@�g(���� "��߶���N����P����!�?��`�������;�����U�x������@��:���BB���#�����Q��C ������������CqP�+*����\�(E��5�`p��L%	��1�B,��13\#,�$-�4aR�QM�QT�xM���O���?`
���r��V��f�ktv�Q�
4�nt=�.s����8�� Gv�����>e�弅��X��"��xNre<�Z�:o�R���D��7�\�&V ���V9�H�{8��4E�ܬ�I�A�e��/���?wl{ڞ]m��J������������n �?@ﾗ��������������?������
��꯾�_��7��}��~�׾��������~�7��[��ޯ�?{��u]��1�c{� ���mZ^�:K"E�f�qKI�c�~�43�͘��DJ�!��b�A�hQ���_�h�e���Џ�W��6H� IA��
��H{/)j$�F���.\^�;Խ���8�{.�����w��	�3�^�DYl����-���w>���?H_~����Q |���+��<�}���)���{*o-��.��W1l�3[.�?{��_��}=~�
�ǯ��}e���?�^��mh��D�^�­�)�4ޞ1���مYv3H
|.[��vj��t9�i����Lm���b̂�[~��ܝ~�p��� ��F:{��V�[��R�C��mռ�����P-���K�"_3���>>T{�p�����qk��xu\���v���i�ӗ�2�>�vӾ�/r�ƣU���cC�O�Ճlӛ�K�J6b]��������b+.���b�Re4T˝��~��礃C�خT�V�sP�6>,4�V����H����VN�=�4%�q���ZA����A,�ļ��*��ޓ���qr8N�u������������r��}���ke���#��u�kq��f��FyNL�D���1,h2d&�]�Ku#�]?���;�3T �n���W��-#$w����It\(��J��VsR��ыq�xq�+���a�[��,3e.,�A�{��. ��N+v��2�Ė7>��ۻ�L��jq�G��t}_�?�$�B0��¢`D���rQ-�^g��>�,us�v���ԢJMJ���������R�ba��b9�nݹŲ�+o��G�V�� <浴��G!_��{K��EU��(�*�r��Fz�q���a#Ve��Y�#�LZ ��L���Q���[,LQ�V�})�Ȳ�BKg��`�ʔe�pj�, ����X������t)8�G�>He��l��ᰗ�%�J��f�Y����27���I�Fv����'���-V�f�L�!�T�L��.�Բ�2\�X��K{�Œ�SPLS�n����/�a�\ZQtn�˷zc��W��ސZ@fjc=������Wv���ܸq��2����TJ��9L��.�XX!/J�Q�	�������b�,��"uj�, ����X��-o`��.���l�@ky��Q%;���(m�*9_v������VGҎ���P�j���A���J^��(����{����rt6Ggst��t�kO2�;j��ƞ*�:�&����E��?	�>��k��_�5�g+�4ѸX%?6y���	���:��s�u����}k���{:��P� �2�����ߧ^�����E�"v��3��'|��OAB؋Q�z�j�t<I�G9�t�������`$�*�V|��(�@*��D�t[�3�?�9@�{ze�|{\W$e:��a�
����30�(��?A0���cS����#ȃV�$�avc����;��d,�1��7�gU���^��7��q�zi��#�G��o�`9Z~���b��͓BG�sԺ�պϕ�Gȡ��:l#Ov����p��O-������lŒ��NF���ͮ0v NTA`�KhfNB�������,	=��e�S�B*�c�ؼd.j]5
�qF��#�(��J0
:���6Ud����j�L�[X�P�ǽ�����{�����h4&����D�S-6Y��̋���d>��Z�^�b�~��"w�F��{{t:�ߣ�d��7(�C��#� ����C��%Z�tu�H��J�v8N��J1G���d�[�Z�ƮR֏}�Xr���#1z����}�����y�����#�.�8�p�c��z������V H�q�/b��
�6��Lo��{SM�<Ѿ���
ϯ�(�� �h��LkPS]�&�2|i�³�3�
'�*j�V��kd�|M4-j��E]���x[?;��u�I~�������r��E��U����w+�>�Ӻ��.Ǩ0ˁ�!��2�7z�u?�s��[�a��H��� ��gʾ3,l� r �v��t������p?��\B'8i�O��������Q9C%cT�ڃ�8h�"��>��r�JW���|;����`{id�%,z@| ���f}��|�IDZ%��Lf�&�x�1�� mN4Ŧr����֋&}�L99>7ɶ���Eq/^�z�p<X���=^kdB�8 ���0�d/ɓ�v[�����p����6��0�Ȃ�OSZ���۪�uK�8p�V�N�?(��w%q��i9����7�XC�"7������]Ho�.�7Q���Z��DӺon��֮��6��.�r��Z
lL��8��=YN2�@p:�n�%ӵ�nR�lh=��i�Gq�az~|s�5e�:��h?�=;��#o�� y�^�q�����8����t~�����9�?'=�����o��=�p�6΍�.����A'��J��v�m@���3������ku���~��M���msT=@����������l6I2���Q���yX�p{��_����������y�Y������������o��o�?Mc���F�}7���L�蟻�����	u�D� Q'��	8p�D���t�	�h'H�	u�D����� �+���T<�:��o`���|�_Z�y�<�	U}a��c��/��~t��L`��K�8��Q��28۵�v����C-��*�.�`kX�s5��b[�s9�'�9��=p�8�r�p�㡝˹�#3�8�s�!�6�s�@�����!���Fv��[�ɮ�×��������k�������O���9s�Nv����Ӻ�(J҈�%]�X��?+������(���>�r�?�"����.��:�C�:�E�Pd�)j�A MS��	Ue��$���n���ӁA�A�Ih\��cC�=M�!j�7m4}�`�Ti�u�M�o�,��.��w#L9yT��m��=�uq���	�3�܅/�皆!cX�e��'��y�;�u%����������z<��(5�H�T�I��aa(�I+L�y�^iZ�Ȅ֓e��	���y:�o��� ���D���Rѣr�)U�*�,�߫�+qjI�u�@{����.���� ꙥ;sXgm���77<��� ��2���V]�B�I6���@^4�^`�^�d���gÍ�\9�fW'���A�\\ڨ��~Ұ�Ib��8l^��Yd��:�nj��M�+�9�<u.�Ԛ��E��x=�}�b��sƣ�(hJS�����|���:����J��_A���_�n�I|��Y'�@�n�[����ޚ���Fn
 K`�������W�Wa��[]�I����w	6'�[˓O[Wd�.F��2 s�"\&��m+Ӿ��6s`�K�z��" lKS�[^/�iN�0����g�ޙ�������귛ALc�������q��^)�:�Y�iЇ�zE�5������^���L�s�WK���h�����&�Y���J�Gl�O����e]]M�P��o�7�*)���(��$i�r_��B
b�0��,Q�UlVi�[B�t��`��@ Y�D��S��5�<p=H������T�����?8��>_���I��_Mz���,�So7�Y
��'�p��\��bK0 }�HH#[��,7 .i :�,l]��IO�{�6L�_��_��~��t��������&�u�8��O��O���#i��_E��Kе>�9b�k�[Ĭ�>Y'p�(�[�Z�&n"=�TVo���E�U r_���r�&�l6ʥj�(�1�6�D2ll��z� ��J�F������39�����P�o6�6�ޛ�v�|�=*�l鈉�Jl���U�1��F+&��`�,�I��O�*;=YB���4/I:���̟���'�\�(�V��N���%N5����9�]H��X8x���̌�IY
]�t��|���R���I<���d`o��AG]Z��?Kle';8P��R���+Z��t���t���ܴ�`�w,���4��C��W�^L߳l�n-�|�D{�E��@��qq+�<�"C����9��+IT��j�i���Η����^�����/�`e�'��Zf/�_�}�U^G�|SM��*��D.!PKj�����Mz�Io�BM�]i5����-���� ��F���4����?�$=����o����n�.��@�\�x�8Pz�ݴ�C�b@��dXT]��v�v`(��a�m����艋{�����To�&ד�I�9��I=4ई��C�S�>�_>�\��蟦�_Iz���MnD�&W@���/��_����|����D�A��@���?�1o��{�����5B����LL�]H�}�5�w � ,�B�28�}�j���&��
�`}����9�Oѧ�� �;�iB��?ʒ�oϣp�}����0��<Z�
ATː�D�+6B�v��ٵvV����M�s6S�����l���RȒ�f�������%��eYO�q�6����$T�������%�u�R�m�6��:�j����g2]���l�y����?*���$=��߂A�ڢ��Eg<����U�� 7Re�K���S��C��$�N�ו$d��)"���b0�{z�ƍ��{H�eo@k���$���0�&����L����q�HˇMIQ�~���~Q{��	���E �A{�f�3E3>i����]%�f�����Y��(Z�$��e����-��SV����0�zg�Q���E��N���`񜛗D��=:���T��L�2p5��t䊨�px<$jߌ�uM$�IӦ���i� �M�\���n7�c�RC����E��O�:��;�l��l�`�rݭ�hQ���+�3<)�^(���Qg���%��W�����v�Q��E�|�J������:����$Yn��	��ڟ4",�c�q�8چ�Ʌ���.��U���Q9ZJ*;���I5���đT����y���%�I�&���oU�TN�s[�{ĝw�2FX��@;y=(9��	N�{]Ԁu�[8�7��39�Ig�)�P޼>_�m���;�w6�s`�p�ě:���п~��g�����5�s��I�����fxD�5��m��҆w�I\� q�aci��Q�E�hOL�1�_{g��4�aI<�r�D�x�R�"$����a�@4^��y0qBA�������^�z��&x�ē����Ũ!� 	7o�[�lKa�+���ǁ�l�h�~���������)-���׻&-�������8w�zVi�-ܗ(�wQ�C����j��W������iY��$T��w�Ҵ)"�u9C��αPH�w�P������K�x��7��i(j�7T\Z���Y���]*���kA[�{���3;�N�
��NZ�C�����Z.M�'!����>���e]�{^:����>��j�6���٬������OD�~1�e{E��;w�EvɃ�L1a!��������/�
��1ErL˜^�;���(B���T�T*�J:_�s�"�J�Z��#.�u�V(�9��86+��������^3e�[ϸ���X��sN��)�j��t
6Z4�r�
���?�!T��i��d���݊`�ݶ������Y-��iՍ�Q�������o����K�o����Ƶ�o����&g#g;>9�����͢��,
�8���c��	��o��������1����������m��K�Z����3Z�z�����D$)�bs���[�|��{��|�o����gk�ɍ7�ާNʯ�!�0��t����{?VX�>�YM��'��ȃ����g,����g��m%󷬛�O��ِOJۓ��I�W��U�w��������``�����]\
��A;A;A;���َ��6o� :�Ty4'\�J�,�Ta�t�sa@h�1����[cCk�X��~H��uhg@Zg�V*[�p���8��dj 	�!H����l�ʴ虡�J�m��3Cp	��D�����Dg�H�e�6Jk�6�挋/.P�t���B!�B!�B!��?�)�   