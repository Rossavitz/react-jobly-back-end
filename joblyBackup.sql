PGDMP  (                
    |            jobly    16.2    16.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            	           1262    49926    jobly    DATABASE     �   CREATE DATABASE jobly WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE jobly;
                postgres    false            �            1259    49963    applications    TABLE     o   CREATE TABLE public.applications (
    username character varying(25) NOT NULL,
    job_id integer NOT NULL
);
     DROP TABLE public.applications;
       public         heap    rcumm    false            �            1259    49927 	   companies    TABLE     U  CREATE TABLE public.companies (
    handle character varying(25) NOT NULL,
    name text NOT NULL,
    num_employees integer,
    description text NOT NULL,
    logo_url text,
    CONSTRAINT companies_handle_check CHECK (((handle)::text = lower((handle)::text))),
    CONSTRAINT companies_num_employees_check CHECK ((num_employees >= 0))
);
    DROP TABLE public.companies;
       public         heap    rcumm    false            �            1259    49948    jobs    TABLE       CREATE TABLE public.jobs (
    id integer NOT NULL,
    title text NOT NULL,
    salary integer,
    equity numeric,
    company_handle character varying(25) NOT NULL,
    CONSTRAINT jobs_equity_check CHECK ((equity <= 1.0)),
    CONSTRAINT jobs_salary_check CHECK ((salary >= 0))
);
    DROP TABLE public.jobs;
       public         heap    rcumm    false            �            1259    49947    jobs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.jobs_id_seq;
       public          rcumm    false    218            
           0    0    jobs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;
          public          rcumm    false    217            �            1259    49938    users    TABLE     9  CREATE TABLE public.users (
    username character varying(25) NOT NULL,
    password text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    is_admin boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_check CHECK ((POSITION(('@'::text) IN (email)) > 1))
);
    DROP TABLE public.users;
       public         heap    rcumm    false            ]           2604    49951    jobs id    DEFAULT     b   ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 6   ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
       public          rcumm    false    217    218    218                      0    49963    applications 
   TABLE DATA           8   COPY public.applications (username, job_id) FROM stdin;
    public          rcumm    false    219   �       �          0    49927 	   companies 
   TABLE DATA           W   COPY public.companies (handle, name, num_employees, description, logo_url) FROM stdin;
    public          rcumm    false    215   &                 0    49948    jobs 
   TABLE DATA           I   COPY public.jobs (id, title, salary, equity, company_handle) FROM stdin;
    public          rcumm    false    218   M)                  0    49938    users 
   TABLE DATA           [   COPY public.users (username, password, first_name, last_name, email, is_admin) FROM stdin;
    public          rcumm    false    216   �=                  0    0    jobs_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.jobs_id_seq', 600, true);
          public          rcumm    false    217            l           2606    49967    applications applications_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (username, job_id);
 H   ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_pkey;
       public            rcumm    false    219    219            d           2606    49937    companies companies_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_name_key;
       public            rcumm    false    215            f           2606    49935    companies companies_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (handle);
 B   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_pkey;
       public            rcumm    false    215            j           2606    49957    jobs jobs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            rcumm    false    218            h           2606    49946    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            rcumm    false    216            n           2606    49973 %   applications applications_job_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_job_id_fkey;
       public          rcumm    false    4714    219    218            o           2606    49968 '   applications applications_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_username_fkey FOREIGN KEY (username) REFERENCES public.users(username) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_username_fkey;
       public          rcumm    false    219    4712    216            m           2606    49958    jobs jobs_company_handle_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_company_handle_fkey FOREIGN KEY (company_handle) REFERENCES public.companies(handle) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_company_handle_fkey;
       public          rcumm    false    215    4710    218                  x�K�420�J�4�1z\\\ /�      �     x�mY�V�8|v�>�����ȭ�g�v8sN��l�-�%�$SS��������a$�e�2###�K=�0�u��1�8������hQ\��ʖC�T0�ڨl��7���w��J����;㝙?j�Cg�1�`L4�U^�QߍQ�U�A���'���l�Ii\RV�kmڨ�k�W���;ކ����j��]e�le���6�v���*�4�l�N�7W���ҷ�Z�J�>F�����T���y���>��żw��^�U�����K�g�S{eJ�|gK�W+e]�s�8T0�ݨF��F�����V����:��j1�Ǚ�Z��+x�֕����b�Z���h�s�d�N�N�?���['G������~E�#�����1O����w�F�&$�����s�p�J�3��F�qU#��x0�^L:���&$8˛���b�	�|��֕��8Q�0Y�>}��7�t��_;ذ4zHv5 ^e�}�z��2�յ��*X�5ڊk7�u�q�cR�`l�� � f&�b恘�|贛5:��Mq�g7y�㮸�W�e��U����d�|��{�����I��p���Z�J�=X$�0��[�Y�M53o�!h^�����8,@��Ǯ��h��\�y��oF�"1��F�ؙʖ�k��W<u֕b���:_1g�iDg��,X������2]����->��Ԩ�8��f	,��kc~�Ȟl����m�cY3C�!'�.��i]��"?ۇ+=������5��6s��^}/��o6�����Ź:�����M�;��+� 1��ۚ-�����z �ð�����:.gGǇ��� ��]G��A�:�X����b�¸���CDt@U$aD�p���kxaJ]%��莹�.M�K8zK��h�L��Q+���u�e��6?Z£�Yz�?v�XR}#u!z5q��`��F�G��͚��Q��`���@j�%�#�V`ԓ��"�p_��L�/����ȅ#P�=��j ��[3�i%��{�يg )��ޣ^awG�������.;ݼ?;@�U���9��qNbH�yc)!�kp���iW|��K��D��u^�\��S�p[���P�fK|v&dY�g����e],|�����X)�Z'՛�2ɝi��܋G�hg?��4р���{�|�d�U���mR�w�����KK�Ԡ�-����M��L�j�(���L�m7�3��\T<}iM���3I����ګ��j%�G0R3k۲x�H}�~Q��.e�Iѓ�l�ggp�
Ԍ�F���AdE��C�Z0lq����`���}7Qy�l��×(-��$���8�W!U)�� ��s���Si�l�d>e�7���@�T<�lG�9Hp��P���K�]���'��fN�,�n���b�S����G���������N9�����V����4H>U�P��c�/1�f�)��4�3g���*"�P�W��1�M[,�� Ô��y���b��NS�2~l%�ޏ ��gE��i�ʜ��w��L/���Q��5��bV�f��t(�Ҋ>EU@]����ҷ�I���PT��⸸r�o:����;�C��GV8P �Y�����U���k|o�'����M�P��g�Lx�H2��pQ<KA	^4/
XaA^��R�>I�,g��Y�Z>����าѦeX8������Fޒ;"=H�XM�(cy����q�?|�l�>�+�e
&����L�!�0���S��Se�jefK%�WA�*]n������w	l�v��x�6�&&�:~���@:��V&�J�hXl�uM�5]��2K�A�W|CmS|���Ow���ܠH4Sq ���O גV�&Y,���Zh:�V��7�Rs�*̬G�o9R�����nq����W3a��j(}�U�,���z�?G�z���x�\� ��z�[=[�_�\q&��i�j��.�^��M�� ���F�N��ts��"#A�:�";��K[��l�X4�~:@X���\�3qX�BV����&Aw��z�t9�9u�e�w�Ց�eq��M�b䆓�^q��F��`���Ծ}�0آ�6����! � řP�v8�Fq�8�O������d>��Yi�4��Om����e;&�/�ٲ��֒v���~3��~4#�^S*9f�� ���<RcƼ��� �P�*i�f�H�q��;=���4�7�����;[�Ѩ!�Ao��W��}�U N�5%~B@i�|���e������2	Y#����%�Ԁ`6�Nq&�6p�8�������
M��k����ȋ#M|�GЯo�E[<�F,g�'�s�;�I�v�g�'�b"���9��^&#��Ǟʛ,�N.��ڮx�<}�g��ǒ��Z� lBMKN4���v V�I�j�*qc�g�:�! ��6UhA9T�1<��-.X�&){c`�R�X�N$:��˞u�8xi���֚�����f5����fw��*[13�b]�m�-�2�cmS��v���i-��~��7y(���������Hp[z׎���
.5m)����ޢ����@yύ$,�V�!�R��]���Q�����l�iG]���#���t��a'p/��ٖ"���P��k-����1w�T�rK#��CS"�JKI��22�X�E?N/��@�&77[���`���O2����s�_�-/���� E��� �X��M�fk�R����G����sذ����z���+���O�v��?�!?5ȕ��Ɍ0̈,xv�\iD'[z��H�*忸g"���Eq�+��
>ߏ��N�*�+f��
�E��>���{����\q�p>)��o3�O��s�Z���W-	�!;J��}���7g/`�Ȟ�m7W����*�s�5��&�Z-�Ml��ְ<l �6F7���-/��t��.Y�;�-wr�K��{oe�8:*.�&j�����dhbP�]���ه�	���P��n���d-E��f��m�,��X�
$?9���Á�Ṱ��0�n�G��dc*]�����7��������SC�	��� [�-�F�X�-��-��<O��Nњ���`>5��{'��t�^�a"��	9P4C\����4���e����X(��E��w�߲<�ߡ�� �nƉ4KG�'E�ԓ��!�����'F=Q���!cV�T�JBȔ����u+�Fw�d"7�Z�q-k���[}>�;9A�(1���%m��Ԝز�M���� �u��Q&�\���Ʌ:��c��#��ҧ��g�\~��~ȿL]S��oG]WZ����|���˗/��tB            x���˒�F���)؍�r�7@˶�3�����of�BY�4\�,?��	$]��T�f]\2O��_�x?y��'Y�;��)�nJ��^�=˺*��F>�Ղz���r/�����1MT�Ѡ�v'�l�O��Z���MV���Oҧ4�U�Ms�����Je�*��<ʼ^p�,��T���Z�d����.>�R��>\��uԸ;ݪ<Q��ev�j/��k���U����T�"�>7�:���4�`MἻ�l��Xn���C��I��r���/*��i"3]�g,����2�`ݰ�,SY-�EYϋXo�.����i^�e�Wy�k�=�H�}���mY4�����+�b[ʃ�4Y��5��{���Mt�6����z�o����K���%�Pb��L�jA��!�fi��e�Kǧ�m���Fn�`hBȋ!��$�
�P�_�2�EY�{��E����v�eɂ0�SuLvEVlӪ~�'Y��&��k6ڌi�����4�y����.o�ԟ~-�YQ.��2Sؓ�>')L�>V�(��������p�	��I��C��klUp�Gb6x^�,�qA"��aWÏ���=�ąs������^��_r��~�?�ʯ��=��a�u���i�[���R4%�?:\�[J5�<�/�KIeZ��Vz���FU8���L�ܿ��¤lJ}�Lj<���Y��&�0��{Au�gX*��b����n�6��͂�ˀ2K�w�F�� 1� �㤵��km�Uo�uq�,Փ�׆�o�D���RJUu1��e�����Q�Lj���qA#��*�Ǒ4���k��K,�I_{���w��x�t�{$�7�W_�I�IjQ[Е��,�Aj�3#|0
�^�gY�x�bs������^���xQ�oZ6��.(�����gY˵��~�=�j�5܋V�I�x!;�6��&���N����X]wƠ5�j����<�7�y��2�Ŧ5��������(ؘ�Gd
Ҧ}z�i��͡2�G/o8@<F�vzhr}��Z���NS؍D⪩#8N���|:)����{�!"}�xņ����#D��n~%%1Hxa��a{a����+�Q��:����MY)�ld"(�?*��/�5�����	Ԋ�;�h�#4�/�y���G�o��l�i��t�v��2�Թŵ�+�}(���v�Ṽ��,�rD�Q�w~1zw�$���K�8��Rp����U�E6��yy�E�w���<����Ѕcw��#M��AR�E�39믙8\'�&ׯ��㯁W<�|��g8҂�FI*�=��]x�^x�7O�#+��X_����U�����	����U�|)@���UWNM�N�!w��H�S����{����Uȶ���:}"66�&&#�#�������
�nՠ{�y2����D���E?�Rgg`�lӗ>��/W��J'�%�Va�H��V\+%�|<�D�:�7�2z�!�>�"o�m��$0S�?$(�j�lYCsu4^4M�!œk���֝5bq�4� �ZԾ�'�k��{�
os���;9�>���whk����HZz?I���{��C
���p �mYC+�v������:ou�W]�a1u�)���{�<
��t��:�(�>lҶ��˭�[�Y�J�~K�j	I'������Z�%����X������SV�;D�C����LM�T�?P��䭤G���-�a��MQ�ׅ�`�xo�J��P���r8�*��������7�zT�q �DSLΥ<
�?$��Re�%��"�&qtQt#��+���#Z��щ���{!�M�cN�3��%�,ZA������[(�~ߠe=M^](S�'�чL�0���Y��)g_�JuP:�yռ�L���!ấ.���Z��!�	j¥��j��I��٨��W`]8��qY�-���+ pU��\�Lo�H��1�r��~�
N1x3�KϏ*_IbFZ7'�8�>��J��^5F��@ù+D�NF���G��ާ���u�f=R��1э�h�rv/D�-��=����y<G�}X�ȫ�;YV���Z����W@C��B��~���a��ǓBMT �O
����������{��5$���u��H>�ʸvu;+��Y�mr�r#A|N	�QV;��!����^�R~MC��N�h���oe�U|5kF��X&�	���f���-�V�m���g����m�v��l��s��U�Gt�����^Dr}�Dx|u�E�`~�OX�4,^v�$`���ڃ�2e����0���>A,�@�z�����)�F�[v�w�ޯ�/H��s�^�q�emF���.n�z���%����M�
����ϴ#��j�;����e�g�OB�4r��"��&��%��w��c�/�����&Y��;G�6�KD��J��T��#���u�a�F���lǰߵ}���������޾@2Y�'�qS�w��	D�yuFH�����S*�K��h�&�`���}�PToާL��k����XTu׏��5��B ���0T�.�Tݘ�A-~��x~r����0�I��P�p�۸��� �l*��-p>�Ԫ��E=w2�7N�8�=jۥ��?���q����©[S>*'R���(�'R*���Mw{����|��"Q~;5D}]޴��l}
�F޿2ȁ�ΠW��iI�Sκu*��/U�Q;�5[�8��j���p�$��nh���������LzX]��K�r5����\=��NV��;a��� �v�f�T�g�e���)���<~~3�!��(���}�$�Br_���=*	���,O\���O]�M�O=�eKX<4|�i�xJ7��`kE�C�V�?��f����/>5� iq�=��m��8]~h��n�h�N�f�V�Nߥ�����)��j�d�<��i�����FH�P��vR�yh"��!�ąOs4
�܏ҹi+�	L����2ݟ�q��C�lg;J<��Ӡ��W^�J���$���MZ�%�ޮ96�o 3���иe_�/m5�rh�?@X�)�ݓ��.���C��v@yx=|�h�C�JЛm	R����f���ʼ_��r�yDtR5�P����귇�7��R̄�˭WL&C�����o
�8qr�������.���� ���u�>��T�z��­�nP$i9�գ38��&*PYM�N�
��rځ2�T�H��A��ѓb��u��k,� �&SJ���\�����*_����^��8���H�ap���|�6
�BkT���0	�}�j4<�=�~��~k����M�J�?�ժ(�>�3���*�ƅ�Q%��e��Q��K:xV̦}=	'��l�Qzi���U�
��s�b�n;q����c#HF�#,ϓ���q#"�ﷸ	�`;�M�Cs�H�#6���+�?�G\_c�J�&xp��ՈS�!3�Y��j:{ Q����|b:������`�K�GSE��5��,�̫f�Dy��	pA���=�e;
9��7T�?'�A 0g)	�����PADW��$�W�:��}q�c�|1C��`�И �s��Q��¸X��Ր��p(�w���ȡ`��7�X�Y��{�<��R%��F�*��y(A�GS��ć�39�8����f�����7�/I�kJ]��&�s��aP��'R��\a$U��F��j�!��A\���(��eW����A)�#j���[��X���{���щ�����``ɫq��5�M"����06B���a��h]���ѭ��(�%< ߤ�\�m1���^h��܁�p������|orz�Cis�~_l:�?9ͻ.)��Xrv�|Ҏ�,h;��v4p"�h`�����s�;���7#�5zG��;j�Q����wt&G�<:�������s��,(����w/�7�Ļś��Q�:�xt6�Gy<j�Qg"��#yԚɣ�<:�ʣ6X����G�#��G��<z/�Gg�y�<���y�У�}ѣ/3zt6�Gm(=:ӣ.��	�Q;R�ڣzt.�G�`=�D�Qw\������G��=j���Y�u����G]�=���Qp�:�{�ݣ.�u���}��ߣn�����G�>j��Qw��Υ��� E  G�8>j�љ$}c��Z�|��V4u����|��nDgK�1[���%���D�$��]Ds#��}D{3���}�^���!�Ǭ�>6��c.D�&����\�>fM�1[��9}̕�cVD� ����\�>fA��{�>6��coD���'�����}́�cD�"���Ǭ�>�@�1K���&��=���>fC�1��Y}̑�cVD�#���ǜ�>v/��\�>�:���$��-���>�D���c�Ds!��;���!����܈>�H�1���}̑�cD�E�1G���}l��܉>fG�1���A�1K���}̕�cD�&��]D�!��}�^���}́�c6Ds%����f}l&��\�>�"���!���ǜ�>�J����D�%����]�>nC�qK���}܁��w}|��݈>�fD�&����m�>nA�q;���$��3���}ܝ���Dw"��|���%�����$��l���}|��]�>�H���Dw$���ǝ�>�N�qk���'����ٳ��=�_�s���{k����m��ۛ�{{�������>nA��׉>�2��g}܆��s�>�B��D�#��=���}܍��NDw'����;}܊��D�E�q7��;}ܕ��NDw ����݈>�B�q���G��;�>�F�q[��;}ܙ��6Dw'��\���}܉��D�I��7&����-�>nE�q'�����m�>�F��P�D��%��\�O�L�	K�O�E�	7�O�G�7#���'�%��}�s�>�B�	k�O�}��D��%��#�'\�>aE�	�O�}�D������>�FD�x{�O8}b.�'�>�@�	+�O8}�D��$��l�O�}�6D�� ��5�'�>aE�	;�O�}��}��}�N�O�}�o@�;�>�L�	�O�}��O8}��D��!���'�>�@�YD�p$���'f}�vD�� ��D��$���'\�>aA�	k�O�E�	�O��'�%��=�'�>aC�	W�O8}b�'f}�/}��OX}��D�gO�����b��㛸          �  x���͎�@���[t�Z��*�I�4 :�7� �P���#=2���r�M�]���R)Ԥ��
LX<a؉�QUy�ǩeE�P��yM�����Ց���o_�+�[�h=��zP�=`�"H�C�"E>=8S�q��,���F8/����QÊ3�3i>Y�)�����tח�X�P¥���������l�Y�� F�_�[޽KQ<����iѵ�-�;�UXnC+���+"j��P�9�u��ͪ�P������|��_5�c�����7	��I�)z;Ϫ�p�������Z�{mx2�h��&	F~�3(<��s�x�{n�57V_����Vi�H�\ߌkM��2��M� <f�=�`��>���ܥ1	8[��.�;_�XBIx�	��Δ�Pݒ�@�Y�'�sJQ�O�2�4     