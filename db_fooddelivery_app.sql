PGDMP  ,                    |            db_fooddelivery_app    16.2    16.2 4               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16927    db_fooddelivery_app    DATABASE     �   CREATE DATABASE db_fooddelivery_app WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
 #   DROP DATABASE db_fooddelivery_app;
                postgres    false            �            1259    16928    city    TABLE     e   CREATE TABLE public.city (
    city_id integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.city;
       public         heap    postgres    false            �            1259    16977    driver    TABLE     �  CREATE TABLE public.driver (
    driver_id integer NOT NULL,
    username character varying(255) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255) NOT NULL,
    phone_number character varying(255),
    driver_license character varying(255),
    city_id integer,
    license_plate character varying(255),
    password character varying(255)
);
    DROP TABLE public.driver;
       public         heap    postgres    false            �            1259    16993    driver_coordinate    TABLE     �   CREATE TABLE public.driver_coordinate (
    driver_coordinate_id integer NOT NULL,
    driver_id integer,
    created_at timestamp without time zone,
    coordinate point
);
 %   DROP TABLE public.driver_coordinate;
       public         heap    postgres    false            �            1259    16949    food    TABLE     �   CREATE TABLE public.food (
    food_id integer NOT NULL,
    restaurant_id integer,
    food_name character varying(255),
    price numeric,
    description text,
    availability boolean,
    CONSTRAINT chk_price CHECK ((price >= (0)::numeric))
);
    DROP TABLE public.food;
       public         heap    postgres    false            �            1259    17027    order_detail    TABLE     �   CREATE TABLE public.order_detail (
    order_detail_id integer NOT NULL,
    order_id integer,
    food_id integer,
    qty numeric,
    is_like boolean,
    CONSTRAINT chk_qty CHECK ((qty > (0)::numeric))
);
     DROP TABLE public.order_detail;
       public         heap    postgres    false            �            1259    17003    order_status    TABLE     v   CREATE TABLE public.order_status (
    order_status_id integer NOT NULL,
    status character varying(20) NOT NULL
);
     DROP TABLE public.order_status;
       public         heap    postgres    false            �            1259    17039    order_status_log    TABLE     �   CREATE TABLE public.order_status_log (
    order_status_log integer NOT NULL,
    order_id integer,
    order_status_id integer,
    created_at timestamp without time zone
);
 $   DROP TABLE public.order_status_log;
       public         heap    postgres    false            �            1259    17010    orders    TABLE       CREATE TABLE public.orders (
    order_id integer NOT NULL,
    user_id integer,
    driver_id integer,
    created_at timestamp without time zone,
    delivery_charge numeric,
    review text,
    CONSTRAINT chk_delivery_charge CHECK ((delivery_charge >= (0)::numeric))
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    16935 
   restaurant    TABLE       CREATE TABLE public.restaurant (
    restaurant_id integer NOT NULL,
    name character varying(255),
    email character varying(255) NOT NULL,
    phone_number character varying(255),
    address text,
    city_id integer,
    coordinate point,
    password character varying(255)
);
    DROP TABLE public.restaurant;
       public         heap    postgres    false            �            1259    16961    users    TABLE     m  CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255) NOT NULL,
    phone_number character varying(255),
    address text,
    city_id integer,
    coordinate point,
    password character varying(255)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �          0    16928    city 
   TABLE DATA           -   COPY public.city (city_id, name) FROM stdin;
    public          postgres    false    215   �@                  0    16977    driver 
   TABLE DATA           �   COPY public.driver (driver_id, username, first_name, last_name, email, phone_number, driver_license, city_id, license_plate, password) FROM stdin;
    public          postgres    false    219   �P                 0    16993    driver_coordinate 
   TABLE DATA           d   COPY public.driver_coordinate (driver_coordinate_id, driver_id, created_at, coordinate) FROM stdin;
    public          postgres    false    220   �W       �          0    16949    food 
   TABLE DATA           c   COPY public.food (food_id, restaurant_id, food_name, price, description, availability) FROM stdin;
    public          postgres    false    217   F_                 0    17027    order_detail 
   TABLE DATA           X   COPY public.order_detail (order_detail_id, order_id, food_id, qty, is_like) FROM stdin;
    public          postgres    false    223   �i                 0    17003    order_status 
   TABLE DATA           ?   COPY public.order_status (order_status_id, status) FROM stdin;
    public          postgres    false    221   �l                 0    17039    order_status_log 
   TABLE DATA           c   COPY public.order_status_log (order_status_log, order_id, order_status_id, created_at) FROM stdin;
    public          postgres    false    224   Em                 0    17010    orders 
   TABLE DATA           c   COPY public.orders (order_id, user_id, driver_id, created_at, delivery_charge, review) FROM stdin;
    public          postgres    false    222   �       �          0    16935 
   restaurant 
   TABLE DATA           v   COPY public.restaurant (restaurant_id, name, email, phone_number, address, city_id, coordinate, password) FROM stdin;
    public          postgres    false    216   Ô       �          0    16961    users 
   TABLE DATA           �   COPY public.users (user_id, username, first_name, last_name, email, phone_number, address, city_id, coordinate, password) FROM stdin;
    public          postgres    false    218   ��       A           2606    16934    city city_name_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_name_key UNIQUE (name);
 <   ALTER TABLE ONLY public.city DROP CONSTRAINT city_name_key;
       public            postgres    false    215            C           2606    16932    city city_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public            postgres    false    215            X           2606    16997 (   driver_coordinate driver_coordinate_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.driver_coordinate
    ADD CONSTRAINT driver_coordinate_pkey PRIMARY KEY (driver_coordinate_id);
 R   ALTER TABLE ONLY public.driver_coordinate DROP CONSTRAINT driver_coordinate_pkey;
       public            postgres    false    220            R           2606    16987    driver driver_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_email_key UNIQUE (email);
 A   ALTER TABLE ONLY public.driver DROP CONSTRAINT driver_email_key;
       public            postgres    false    219            T           2606    16983    driver driver_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_pkey PRIMARY KEY (driver_id);
 <   ALTER TABLE ONLY public.driver DROP CONSTRAINT driver_pkey;
       public            postgres    false    219            V           2606    16985    driver driver_username_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_username_key UNIQUE (username);
 D   ALTER TABLE ONLY public.driver DROP CONSTRAINT driver_username_key;
       public            postgres    false    219            I           2606    16955    food food_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.food
    ADD CONSTRAINT food_pkey PRIMARY KEY (food_id);
 8   ALTER TABLE ONLY public.food DROP CONSTRAINT food_pkey;
       public            postgres    false    217            a           2606    17033    order_detail order_detail_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT order_detail_pkey PRIMARY KEY (order_detail_id);
 H   ALTER TABLE ONLY public.order_detail DROP CONSTRAINT order_detail_pkey;
       public            postgres    false    223            c           2606    17043 &   order_status_log order_status_log_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.order_status_log
    ADD CONSTRAINT order_status_log_pkey PRIMARY KEY (order_status_log);
 P   ALTER TABLE ONLY public.order_status_log DROP CONSTRAINT order_status_log_pkey;
       public            postgres    false    224            [           2606    17007    order_status order_status_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (order_status_id);
 H   ALTER TABLE ONLY public.order_status DROP CONSTRAINT order_status_pkey;
       public            postgres    false    221            ]           2606    17009 $   order_status order_status_status_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_status_key UNIQUE (status);
 N   ALTER TABLE ONLY public.order_status DROP CONSTRAINT order_status_status_key;
       public            postgres    false    221            _           2606    17016    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    222            E           2606    16943    restaurant restaurant_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT restaurant_email_key UNIQUE (email);
 I   ALTER TABLE ONLY public.restaurant DROP CONSTRAINT restaurant_email_key;
       public            postgres    false    216            G           2606    16941    restaurant restaurant_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT restaurant_pkey PRIMARY KEY (restaurant_id);
 D   ALTER TABLE ONLY public.restaurant DROP CONSTRAINT restaurant_pkey;
       public            postgres    false    216            L           2606    16971    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    218            N           2606    16967    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    218            P           2606    16969    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    218            Y           1259    17054    idx_driver_coordinate    INDEX     X   CREATE INDEX idx_driver_coordinate ON public.driver_coordinate USING gist (coordinate);
 )   DROP INDEX public.idx_driver_coordinate;
       public            postgres    false    220            J           1259    17053    idx_food_name    INDEX     C   CREATE INDEX idx_food_name ON public.food USING btree (food_name);
 !   DROP INDEX public.idx_food_name;
       public            postgres    false    217            d           2606    16944    restaurant fk_city    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES public.city(city_id) ON DELETE CASCADE;
 <   ALTER TABLE ONLY public.restaurant DROP CONSTRAINT fk_city;
       public          postgres    false    215    216    4675            f           2606    16972    users fk_city    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES public.city(city_id) ON DELETE CASCADE;
 7   ALTER TABLE ONLY public.users DROP CONSTRAINT fk_city;
       public          postgres    false    4675    215    218            g           2606    16988    driver fk_city    FK CONSTRAINT     �   ALTER TABLE ONLY public.driver
    ADD CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES public.city(city_id) ON DELETE CASCADE;
 8   ALTER TABLE ONLY public.driver DROP CONSTRAINT fk_city;
       public          postgres    false    219    215    4675            h           2606    16998    driver_coordinate fk_driver    FK CONSTRAINT     �   ALTER TABLE ONLY public.driver_coordinate
    ADD CONSTRAINT fk_driver FOREIGN KEY (driver_id) REFERENCES public.driver(driver_id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.driver_coordinate DROP CONSTRAINT fk_driver;
       public          postgres    false    4692    219    220            i           2606    17022    orders fk_driver    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_driver FOREIGN KEY (driver_id) REFERENCES public.driver(driver_id) ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_driver;
       public          postgres    false    4692    222    219            k           2606    17034    order_detail fk_order    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE CASCADE;
 ?   ALTER TABLE ONLY public.order_detail DROP CONSTRAINT fk_order;
       public          postgres    false    4703    222    223            l           2606    17044    order_status_log fk_order    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_status_log
    ADD CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.order_status_log DROP CONSTRAINT fk_order;
       public          postgres    false    224    4703    222            e           2606    16956    food fk_restaurant    FK CONSTRAINT     �   ALTER TABLE ONLY public.food
    ADD CONSTRAINT fk_restaurant FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(restaurant_id) ON DELETE CASCADE;
 <   ALTER TABLE ONLY public.food DROP CONSTRAINT fk_restaurant;
       public          postgres    false    216    217    4679            j           2606    17017    orders fk_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 8   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_user;
       public          postgres    false    218    222    4686            �   �  x�}[�r�F}} S&@�%^$yX�R�T�K�D���@����sO/@�����r�����6<����A��YU;{�MejS�������Guf{8����W�jP-x���R�������nLN��4u�LYYm gué.�.��8[�׸��CD��2N<����1���o0�;��՛e�0|Ro���T0n1P�V���o���w��_=#`S�U?{�zm���ҋ�Y�\����+���#>��;N�;£���N[x±;]*Ө+�+�~�ى~\.�V��<#������'l�k���j�c�^�Y��֓e�@#?hCF*4���2R��n��6�E���0>�ߎ��F<Ҥ�:����6Tmڃ�T�^�^��������޴�[�3����H{ ji�g�@����bڽ�#b��tV����&#M��!%��Eۋv�{�0 0k��>�^vڣ�ʉ�<��OF���D�}��gc�n�9˔��FL�Y�����.^T�jpyQp\=�Ƕjp��LQ� �Cy�vP���`�xSy�p���v��W�f�״p\�f��qCW��ɴ���eBNV�P�M�d�l '�*;"�r[]��uB1'�{���ₔ[�����֪�h��s����V�+j�>�p9Y֣��l+�8�E�&G�.~%�/{��:dg��ۍ�����dn~� �<����=$A���Q�y;t�.�i�K��{Io�I��何��B��Q��K�@�Zc���U���^�͈����}����)D-�|u���}�}�}�=�\��j�ʮ��{wR��},U	I�j}c};ş�d�q/wǍG�T2m�zlDr?�c�$��r7_&������V(A'��\+�ŗ����g���b���̒���,�`���P���̒�K�xu\��E:����h.� ��
_i������X<t�9����
�|�"**�Z�~kuNգ��D�%���� �,GҐ7�.�HA�X��\�Y��&PP��
�9;�ߔ|�o�K�낝��+�=��S��ca��] B*&�SW�˸� �m/3I^ �1�H��gmvU���$]'�P%b,I���LMIb�^�ژ+��K��8ٟ�$)?(@X�ǨjI	Ae��F~@�$k�uŦ��..Y��qB�W�9����Wt�G�T�I���bv�Xc.`���![%���^�V���G\���\�7��u��x��W��D)h��&�2o���
LH����yՠf7{PW�E�����w#΀w�
i�XP3m�;{�hG�-׉C����������$��]��z2D��Rjv����2����A��.��i��<�LA]���h��'..2��3�j/��Z���c�󟤀����"N�&\�q��q��c��[s�c��N4�X�S�K�Mw�zc�����Ӡ� ��qK;<���s��I�D��}���_����HF�si�`Z����W��W	���I���
�sy�l��f�9�x6kԛ����)53��
Βu�9��K��$G`9/oA��Jom��{�;/�)��tcEЊ	�1��	y�}u�d:˜_%�?���ܱ����׫$�9W;��Z�Pg�3��ġ�9ùS.R������V���y�ū�"N�W��ɻ��t;K_����ʌ�M�&I��r965~�ʪuꤨ�ےna[d��牪@�o?үg��dK��ZAκUwR��>s2+�`�&��Ȅ�_%��U�p/��	D�B��^T��]dj�r�J������W!q��֝�~�;�@�N�nq�X@�[C��>�R�:**E��*f���������9ҒQ�I fVb���Ci�
��w<ғ5\������V��6�p���tg�륷�ߺ:�C�=�v�rb�k#��̵�C�����Փ�S��^=}M���*���`�x[�>��X;���`���|��� �"o�.�7;��g���/�����T��e�w��y�\�M~; �h2�'���f���#��q
d�9��N08$^�5�ګ�2c�#)&�Gv�R��O�gwˌ=O����S�N��`1Ṿ��+X�=c���7��$�`��pB����`g�r
t�$EbS��:��p�.%�d�t��C���dƁ �G$��([P�k�,�ic"��f$|:�\;[�,�I�o�%�ʟ��Y�$Y�[8��H]򋐋~�����S����	= r_�g�7�%g��bQ���OKN`=�"K�bӦ�KNe�Ѡ�*���wRI�H��4	��v�t����._fS4�%�]��*�rX7O�u��}8�z0���Y�Ю��L�����1��yZ�Ш�,�htm�#�����2�������>�0�{>bq��W߷������#���n�f���c�ތ`��`�M�lErq��Kκ���>Uv���; ��?��fߕ~5X��=��gt�N�E�0��")�mi���'�Y{�[�S%�*�.�⟕�m�$�*�@���%Sm��F]\����g	{��w���y�r�֍=����E����е�x2{�1�[���
v4`_Uo��^?
v74�ɳ`��n
*W8����,i�X����~���#i9Г'B�涠�_��.��޺��V_�R�OJ��u��� I���,'�,겺�����sY���xc7FҜBIZ���=׃���Kޣub��g۞u��Q8���!�1���^�� yQ8��w���!
,n����+�z}��=�^c� ��1Z$��E���3�ίX$!��/�q����j#)�= 7H[I�w� ͂;��(>��a1ݵ֧3<��Lo�EB6$5��7\=�Ӏq!�qeMz��!��D��J��fLy
����'��Z���Dж0� z��%��`�Z��r�,��"Za��/�Yx���}��w(�cߜ{F~E+#��/�7_Q���ǭ^Ee�i��nӡ���׻r>eS���S2e����?}���a�.���vr��2��ÀG�1 � 2�;)������K�4����?���/����jи���A˾f�K)�ϿH�3��U�ȏ�\���]�:ߒ�|�ZP�ؙ~?��E�P�7��7wF���J�dg�c�w�2��(I�1��䰠%�>�(�^`�]@��^eS���X����}ڊ�@�d�;�ݵ(>��^q#n�}բ#��lӪ��֭n{O����L:y:%�j�H3��^<������:���;��8k2J)�/V8�c���f>�Sjݝ�Wh4���x�)�@յ���L�Sg���;y��bc�5v?����4諛-¥�r��Ždw��7�]�c����͋Tq��Zm(���9�OW����M�L�C��SnavD�e��bށ�����ŵePӭ;��,}�،u�����&�X m���6E�a��r볮��_;�`s�؈̭��W���|F�x��<MF��!�Kl�d<��}�ۀ�-i��gMǤ�B��F�q��'X����G8�\�'jO�ëyb����j�<R���TI��V�?��Q�jC��xd?˨�7��wg���0=p�^q��vw�p�FEel�d��S�8-$a�9eշ2 � ��w}l�kV����o)k׬EJ7�gk֞�Jd�7���;��&�M��L�%�	/�B�é�N��rA�o��#>��+$�,�U��#�ۮ�Ó���*�?�2�`�W�����R4�=�&͜*��u��U�B����9��ҩ^P;��uV�j�_J���T�:I�������]�Z�h�Qck�2�;gm��'K�$��P}�<vw�݁�����7�RGs����^���7�de�ݞ����c�R�b�?@���5��O��v�aκ����$ɾ�87����@��mU۾L����y�#��p�*y~#$Pc�ﻃ~��c���oL����+?~��ī��}ww���          S  x��V�R"I}������DoԽ����r�Flh�H4LC���oV7����>UfVЇ�<y2��x�t�B97��f��V���n0���8�7�I��="�&��(�B�BŅ��"M��i~���^|�{p�q<r,�Zn@Ս��*:�����ţE���	9�T֣(�j�$��<ڋ�����?^��y�$fPYY�L]��l�����U%���#T)��V�$���ʣ	8'�[Fz����(�����x��3p�P��\�y����߂i�L(��E��X�H�w���K��	�]�ĺp��� ���<��PZ��;":����a��НN�o�@�̍f��kơ����^���s����`2�T����(�L���G4�G(��_�?/�V����50��_I^����7���
/r�7 \�0�a�,-hQ%\jҸ��~�!��l��#��Fn���$�ʄ�8q�,l.��/t�v����sT�К02��k)I:����n;�����_ ���S<v���_��^��q��(Q�Τ�
�y
%7�䌜4ڰM����h�_0y#���\��fn�}�����_`8`��JE���t�����.��_���i�N��8��NC�Ȇ�[fE,������ 6���oop,Y�=%8��"�kR>?����T��Y%`k?ZS����	y�ƫ������eX*��P)�i**�Eã]l2I'�p<d��������q���N������l�~Ha�R���0�P�)p�*d�0���0��;�S���{��K�,<?���	6o.�OX#%+�S�~�^��/�V��^+,i�+�^l}����K*�������s�2����.M\�l��7��9���X�m�	-2%��=&Lqrw�HU��U�Bug��҅C�sB%{��,�����m0"�njjC`_Uc̐��<��n{>��)����Q��LayeB�9{1\�M�ˣ�8N�"���Z���Pv�.k�O�%�ZJ�2m&��[.�
�2�ϥ���cog���Q�| E��g!��YH��FF�B��H�
.+=�N� ����%�C�*7��LX�O+nk�kS�u]�PT�Ba�Cfq@�xeT
���.��P�E�絀���@<�u�H7.U^�ί�D�2Z�$ґ�,
�6�ס�3&����=�L/5=��{cd~͟�YH�lVDg���)H.�}�mHyhq�#��U��I��-�=���ϖ[Q L�WSLg37���K����ƭ��
E�Lr��T�v�@��X�f,㆜� -���^�!`�fI<Ƣus�1���4e��d��T�,�\rN�ƞQ����<�Pe�v۰c����w� ��,���Oܠ�y>��7(��BQ����O���L�.�(�7�k�
r��j�u=|`�0��:8�O�?%~*�����E�0��O-�Aܙ��!�b�uT%�ؼ9�m�4��7��L�3p�98��?39�n S?�-Ł̐_�#��0?�=֭g)#�(�r}|�z���<�-�s�Gݵ��K�>��ۤ�Z5a��*BeǷ�0*O���InaA�/�����] �_�f8�q���n:�$��ͬp��D�*1m���ǐ��V~�8�n$9k�����jk��I y��V�bI�*�u�i֟�&��v�	}�~�U����ژ�
�2*f�zwM��'{g�ڋ߾�(=���)u����ȗDԓ"��ί�2oWB�Z\�B���4/�z��������l���V q+���t�����yԭ���29a8��Qu��LMz8=`�#}���Ɍ`�e����-F�Aa�7�E�2(���H�"w�ҮV�n��֩V������o��ĕ         Q  x�uXK��J\˧�2��$u�w�s�bK��q+�b0Cv��H��EH�E���d߄7���s��������/�T?�<da:����dڸU�R2�x�nb�l�t��Dɋ�K�)�� n��p��G�D���a��Č�O���|u��A�\�Q_�����Qr��Ƽ��=��]�7E"���<:"� ��� ����~�m$
�@�a�~���� �MP�6�@D�G�A�����<� �1id#^#����v��;3.��E�7�l������� �U=�Hמ(��n����f���I�9]�QU+:�D���/�'�F��X�5^��
U�^%�� Y��8P�>К��3�X�T{^�ٔ�މtqt��MP�?�kxԓA��P���lU����D�����؛�����A9�z�$�/�W��c]A��$�t�q�Z��b�s T�rG_�H�P�4�{g�)j���P��|Cym����)U��и@�ެZZ���s�6�^�TS	�M�9��q"���U�
,��?��h���'p�����Y�@!9�u��O�C�C7� t��N27[�r��d}2Ы��Y��k�KC�V��v3�'I�4G� ׾|N��J���+w)�bi��PY����>���P*{�l���s��(]2塞V�g<��}�_�`��[�\�V��E����v?�Ҵ�>O��ySQ��˴��3�
��qx���J��(��$.G@*8����=O��Z�CfC��6u+��^�މ��(�!g�)����|�)��&dhY��G04�=*�F�j�qB���x�i>^�a�ݠ�f*2��e�׌�U�E����sfC�|��ѣ���<�G�F׆X���T/r��M"=!�1�BE���bM 7[خT^��T��e���A�]���.S^�Ѝ*󷒊��@u�ڃj��7y��1��O��r�4���Z,�BԂ�*U�2�ɺ |�t��[����z|���bs��J|%Y��7/�ZN-ً��N����N��@j�ua��^��v�}��E��F�Go��/U! 40"؊�gK��-I@V�b8ߌ��N���Xʊ�ﶛ���Z!hS�%5�L�����ce^�M&35Ac�^��X��fC�����h�9,e��(U&R�tRQ�8q��� �u����Z�Z��H���\,�u��%%T��c��h���&��K�ѥ>.��b��7o��/U�a]ǓT�Ǎ�`�ӫ@3<I�)6�
z?/�J�	!�k�a��$�#�>e�*Ԭ� b��ON/�aXh�gU3�����~i���xM���\{1�X�u�M���7A��3�
��z�o<7�KM m�!�|�o�#��/,�o%�"㜀?���̈́��yn�<�O���l��MT;;L��J� t���
F۾Nc/�͇�R>nlG�xQ��c��"���j�B�'_��LM8�IqwH��uԅ=Y��Y�*��6�kz��RGV�)
)Y?��1�����6�*7���O�Y��Tx�],6�sr����<9�.L"�i{k\���P�Q�/$��z� ���ǭ"���`�~}�}+�`&��[�����SaL>L %q�B�(��Rc������xҧ�Y�<�j��b��+*��;+FE�5cw�����]�.$´���Α������7���������&�͡���/.�f�����ӻ���N�	P��d�6���.���K�-8nȔ7�ѧ񏡉�����cA��җ7��v�͇�F�M�����/�[u�BM����My�6�ǃ^A%8����	��f�/�2���;�s��o}<����v      �   <
  x��X]���}��I�gc���qڛ����l���T��"@�5D@t��}ν����Ņ�qt��/�V�/"��V��܎�:��/Dw�Y���?t�P3_���(SQx�!�ǳ(�]{aL������������C�ޣ8�C'�sW��ִǎ�cO�8�'Q�tN�z�~�yX �YI�O�^�:As8�O-�(����؋��0�Y�]#�hN8<l,Zڕi����r���0_te4T/&,���j�wu��k� ���fO�n���k+Yw�/� 9O$����:zA<�R��� �l�UX--$@�^l�<ٓ���Z6^�pN��eY�dZk��<s��d�55��^�&��%����W]N$��[R�����o�����t,�D��6�ݎ�O��?�w��y�/qP������?�GU�$�E����]^-���1��,��+A����[e�.^��i�A�Ƚ��ڋ��K�o��#c�o
�����N8̩b�,��	�%�⌉��$O1��*����8eOa�u���V��{��,�/���Ur�K�(VXa���`�N;G2��
�%��q��ݶY/Xh���&���k���Lg��dn�`��)O_�U��t���e���0���ukx��ubD��{!��5�:�(k�}�Qd����`���1QYWۈ����B��t�P�3/7����tm7�����
�V47d��OZ��#�yHJ[��/�z��{Ğ�JQ>�I(;��9�� �o�MW��m�zp�l89����I��w�����c����ʦ�hz�r�N�'��+a�{��]��u�di�`��`�	
�0�)p�ҝ#���Cu�x���$�2i}1Cla��l�&���.�Y.�����AB��F;�7Cg.�(Y���N���V��e`���˙������s;��V���Ni�Wg�#}��������x� hH�hN�P�p�|�$5��5�������i'#A\q�0)N*��	����4w(������a�YE�j�!�0h�!g"%��N������hJiŬ�O[�3�����N��F�{��hZ�r1)Q��n���������C�EE����<l�j�xU;pK�wuy�RE��}q���'`�5��t2��'����z9���w������E{��}��U－��xO�*
���%j&*
��[�ߔ9�3�g�������<�G4
��]s �bj+���L�3�}����a�FI�ъ�vM�ߣ~��hM䊿�N㦵*|Q�0ʎR����j���A�?d�c6]���t��g�Z�[���p`1yefWړ�F��2��({�Y�FU� �|�E�E��7�h[��Y?�`��`�9�}|ՙȵ�Ӣ5^�����Y��R
�l��aS6cU��4g�f�?,dͤ�}&6�C#�d2i�7*�u	Gh�ii������uE��f�y}8shG ��ͣ�{��h��9�a!u�+�RD�|�l��iҥc�y)j��=#f���j��5'i��a0�J�Y�����P�Wd�o�a��S5�[:	iM)엘�q�Ɏ��"�^����߽p<[�qM{[T���.	��d��yF��
1�d{,�ԚiOY��mP֑+�w���ݥH��Q͇�Ņ��y��j��*kT|��fW�$������wW�[8ѻ�ڮ��UC�g]�hy���G뒁���H�s�A?/\O�=#�օ���'E��ZR�����_�(�(�0ӊo�Y7�ɷF��a��B?��l�Lq@����Pq��R���䋪$J�1�5��&.��A �9	�N[*����o���8�)$�#�nU)�!%�Khw[�G�v�ڣ�7�7���/h����?�a�;^yQ����[��CL[��7/�C��٦�:INH�Ѝ��$�FA\��jƗ]n�'tdL��p�Oe�-cF���;���UK�tF���	�}���ЀM�ۥ�?$�V�닥�w��`oz���#�%���0��K�' �	�b�tF����^��kWq�B��4�;��١?{��]���#�����۽;	woA��Z�^*ґ�sG�_����dDB7�Iu%���u?36}֯rqJ$�і��eg���
<ev}-�����3�t�	rE�.��8$K�&xD>i'"���.N���<΃6����;3���Rv�{]�땙֌�w`{��<�۫{0=M�i+'�gY�Z�D㑓$�z��t]RT�	���o���.�V7�o[�P�^�5�����0�*��
���_��Lkg)?Z]�h=4F�:}Q�2��?
�x��z�gt��[��XeԪ��c�]}�HT��q�k�	H�����.#~��	bd$�(���3m�m��l0��"�+��[�����B`G��y��m/%lko������Y��3�-�z&�{��=����,�����a��BI@8SK�0�c�[�JB¾���=��)ekݜ���N�5b�\-��U�ڱE�|�i�t��̺R6��X��a��	�{ǩ?�����~1F��^z�ؠ�4�B�d��`��1��/�:4�8         S  x�=UK�\9S��1c{/�
z��%��$�<�BPn��m�}�|ٞ�ƴ�ò��'��r[��3��|���,|oC�1��}�7���k��jw�������[L�R��氤1Y7O��v\�o%�d�**#Zpy��Xl�+Ď�k�%�<�
��a!���4���^��+�ˀHȐe�_I�n�D2�X�>�~�2��2�!f��O���2QdO��i{)9�$+�����b2$`����d3D@4�yD��y���?X4�<��h�D�dWJ ����[ ���^��vH��R+���
��
Ӹ��f`�H�� i�6��Vd�S�������*#~R wp�b���Cƥ�vOY 1�j�(gv��H�q�F�f+���fB��O�OQlR��xIfF����X)��2��l`�욿�mfɭ�-N�[��)AG�]E5��&���%�b�Nv���%����H7��7�Ϥ�ScjN�����^�ZR���c�Q�����hJ��s�ս�t���w�V�;�I0C ���&�	dBw{h�/�d�ؼL ��!#�F�jl�9���TQN��N���TY���jǔ�{�>�r/�V:>�o���/{�}"TZ����@��c� ���9�ZR}��%�*�c�)�J <::���P�y~�����3�X5J9���$��@8#\� +�#�Sqr��O�I@y�M�b���.��Z{�8��*�W縦��6�t��17��wB�s��k�3��#W1�˱85Fz��,��⸑�	k�X�`q��4�)��p_k4����c.r�F�n�J�jOA�g��d6d�Ji��th�����t*�+������>�7u         @   x�3�t��K�,�MM�2�(�ON-.��9]Rs2�R�2�ҹL`��)�sb^rjN����� �X^            x�eZ]�c+�{�ř@g�_p�r�?�+y��W]O]Zl0F���ӡ�O�߈�D_�1�c��R�� b��f�`�_*/��L�9/�@�l���3B̯x��F� �i�?cU�]�� �5�֚���?� �#�k� ~ �%��x�zJ]���䟬���l�d>W�az����t�b=�����~ a/����!8I?�!F>�����NC'�酵<+WM���@ �ƥ�~.	 �g>��u]���AD�=�X�|�g�O�c��ź����y�!�"Ϝ�8��Da��5�Dj�G|�q#y�v͚~�<�3�������s�4�K���y�!�^:�X�ǥ��^�ͧccW]��L�FL���Ll��K�1�i0�c��;!��Z�i�c��� ��=5�ǘ@������h<��k] �� �@]Z��9����㈆?�"�a�>��F�A�ή���*@؁��$#jS1��b"�^1�s��y5{�_8p�%9��8,Z��́����yk�Z�1�Q�x#����^��&��X�}F�z6�)t��W��H�|��.C��u�o�;����S���T�Yjy�x�|6�ث�>��l��?� =I$��b`ArJ<��u��?�ɊX&��C�\wC���$S�ʃ? �ćMJƩ�m.���$�b�<���$D�b.�3=|�C�; ��� �����6 ��
�֧D�K ��9s<���5��Bt�vp��?u��B	�xQ�P��C������U��Lxθ����
\��ѷ@�
B�8?.(u��+�; 8�(�$�"�Cb;��'�0��@p��\�~,��b\���x�� �0� ��\��"?J9Nڕ�<3��y]�̡2�Dt�Z��K�|0U�W!z@�� �)�H:!v@WG2@ȕA�%X�e���$��>sIV/�S+���(�t'!z@��@�Ϝ��,B� (���@!�C]l#
� �]����X�mT�5�)��iR�a51�aB�>8!�����d��j��L���	A�w)�����k⯲����2k��l�= ֹ��Yq�I��@�Ac���\�|�+�5�)$
8l^1�=r�Es��{8�5�B-չjqh:!�~ >[qiA�]K	��!�C��ZC��v*�.R`�"�u-'D��C�T�
U��;����.��&!~@��ۙ�¼]�oj�MbX����(�= ª�� 
Bc!���g�@t�A��\�Y�r��B�0b�X��_(XW)!z@��|g�[��2�&�+�UN������_L_�m��¹@�Ԅf�*	��Q�"�0"WMB�	F��ȼj�D	��%��U����
�۩K;3�Na�������tB�'�?�q�?0�<�����k�+	M	���;�Te81�c�ߋ��^��� �~0w-/<(#���2j��Q����k�a���X�Ħ��E��b��f��%�U�؎��RtJԒ@�imiL�_W.wh`�Vof��,,:�/��cb�"r�}�fz�	á
9�>EW��AV*9��Y�@w�uQ�^��Kt�D�D-i����p1��9��+�n����860O
fV8�D61�t6c��ղ��&��ap(�^J��'>ΪLK,��]X��Smըns,���؎�yt�q��Q����ʳ!��"��n��ׅ9��B��j1z`�R�ic�����Pc�+'�X��<��ۡV��C��Y<�<7_�LԻTq+
�fx�=0�)y��TE���1ߘ����q��>�����7&�ZF����E���[�v0w	�1b�c���^%0N��Oj@'1A��`XՊ�U(�A���ͪ�-�y�`1��n��k�����/cޘ����i_IL�f����#�������j�O���ҙݧ����k�AϣVO�E⅝��+�ư�4aJ�1��ji!���Y�z�:	�ri,��1z`��3E� ' ��؎�>\���t�Og�K���Y�$e	��ο���T����Q,qp`�|'L1�Yo-���|��yc0NP��� >0v�&0:����Qb��E�ܔ3��u+:w�� ^�r(�bN��ɤ�K�+�<�91G3�b\�
 �+�bpw�[�!��b�K�c�	��s���:BZ0�tM�;�}>F�b�&6�"���6�|]��������EA��]�A��|y7� kh�Q+��,�����
��FKX<���_w��Y��"Ɖ�C�k�\���<��w��e�@�7x<���"K���$�L7\VO�)\�����0���2Iօ��<���A���������vfa\3'����ӀP����4)^��:��8Y�#
��s�i���W��� ����}Z�M=��FLcƸ�h�\�u%1~`��6��`o:���-�H�����mG��A} ʘ8�dfX>����1fK����������A����ymzW� ��H�k��������lG<�Rgˈ�� ���"	���]������5_�/8�8����������8���-]�$}��c�\p8l�Obt���{0V����ܵ�1�)?����/>�-oL��5���/��Ȼ��ʇzgx`��ۉ�!AF�V$D5�_|;�7$������8��f�qʺ�0�*���K�."�eR�Ud8�����o�QwM����Կ~��������Կ��`-	�\@x������u��*J�{CRژqӓ�0�~���!)m��S����s�1���.�n�"A�c�N�ۣ�c��c�聩��|kP+<`�>�jK��b���1~`��2c*��Ʒ+9���SP�0���莑�̴��r0�;0B��va�
�"�1�M_��9/e�ז�mE3/���ŝ��..oL�V��bΰ���K���U*(fCx`c��=R<������d0��X,�8Xf�T�&)�p&�P
>X`b��L
�J�%1�?0��Q���ly+o�j��d�[а����1���V��J��-�Qb�Y�\���ߕ�:5!vt�0�Q[��'�84l +/�>dI���g���c`:����F�~�uG9��፝lt0��̢���.�tc&x���9��$�L��� Yy�����?��Ǽc�Z��\��~��ă���?i��-��>!�0u?ҷ%��U�r#������3��
r`~��C��0l��_��1N> �;��qb��t��)�=0����j߿ޚ*�]5@��#}�p!Q���K�HS
;���������?��`or��{׭ۖk�r؛����u
�Nx���c?d3�e)�m"����fh]T��0�V�y��N�e`�f#S!�3��OLq�ya�I���[����[x�3���K���T8
Ɛ͐{9��6�<88��O-b��#m����	g�S�؁��b!C���E9���Ss��b½(�J���xk:��9��Ʒ  rm�tc����D�"������i�!�-
 T3�1�cXߗ��'���q�}.z�FvT���q����kQX2��D��8�^�v��Y�9�"�wg�fʱ*�8��_������X�ݱr�锳�t�%�~N	��MٛO�cْF��.8��){�ےLվc��F��?v�/m&� �s궟�F+K-fc�z�pf�n�yߠ�L�ԕ�y<u���6�䵽�-�\S����Y�3��$�16|����Ν⽮"F��΄h�K��v7��R�U�>�@p��nj�=����7 ����v��J�p>�� ���jc��Ża(��8N��`���ny������8C������M��R��d�����=Nwv���E��A��m���������I�	�)�d���m���H��Qb���m�}�a}��t�� �ܶ�}�!역%8sۮ�;�	��z���e��)cj,R�D1��Aj�z*��o%1v`�O�����/{n_e��KG�w/N�Y� �  �m���s���h��K���)���{qb��1�e��8�0�s���SvO�{�G�8�4��y��b8�4�Y��ą�p�i��[,���Af��u�����C�#��G�c}��ߝq��%�p}���<(��3�M
QG���Ӆ�CcX�؎����s���?0�ϱP�G�ї�.���ׅ�Jt�\��V��lB^���	%�G�IAO�3�1~`��at�p��c��`X%����I��N�;�[��-)��a&1v`�{��i���"��ݕ�4G�
Q��!���\r�@�����Y���eX��'!�oL�jwH :�������e���Q����־{��'F0�/Eq( Ӏ	b��d7��,�$����Dn���9�l���N0�ȼ�6x��[6��~%E8�)b���S
^��|��r�fb�[Ih��3H`篾t6X���S�%��?^���\_yyc���8N���5,o��_@y��r�~�ߍI�!��$FL�뚉��uþc��X,���ǀY���Y��W)Aa�A�k����hV�+!ǀ��ڽmcb�)�+��ڭm�d�}��*����Nk;�U�fE��w��U�m�a��
��1��C_�_�m>��}�	b}�[���\�bs>I��`�,X�@���I̡0���ܳ��)@D>J��I��	�q�=0٧B��r*�&�tK1b�Up>l� �0��[�����uK�x!�>����o4��8� �X���>�c�e����ǣ�i�ɧW)X��6���# @X;L`}3[�ޯ�㙈^p]��1�8�l�g���/cޘ[�:ݳ&\`}�s������X�iz�hIǋ�uc�=0�����~.��؁�5(��
X�i���oa(C����g��l�9AϤ���yW���琑=�$��I�����1I	������/���Xsg�njK�Ùΰ�5wF膡u{	eiPF���)����M�iOS���;%t�P���
�
���ގ[���~�A�q(G`�{;no�m�؁"����v�ަ��-�6w>�����6$L����f�������ʰ�t#�|`��]�VP��q�'g��boBPޑrUE��TY߄��Ct��s|�x����������u�?�>4D            x��Z�r�V�|n~���� ��[�lЖ�f�-͎<��}Aw��0�@.l��~3� ����*lY��R���Y�zcҍ3��}��A%��[m�&�U��|�s���{]릉�n�vU���u����K|g6���J4�ȶVm'ƺ"��5�>����N��r�Ǝ뜪����Ý���a	����ح˶&�S�8m6�/]������6&��d���">�[kb�tV��R���W����?*�˺���Q����"m�"��|Cʥ~;U�O}U�D��.t-���oѾ���-*�Ctl�׮?NM|�n�ٸ��كU��8�V�8+rmm�7,͵�1�c����v�Qٌ�nz>!�gܾ)�{[U�!��Ҕ{~�ȠF����;	����}P62L��&�V��5������Ms=�7y���O�V6�x��ct�:��nڟ:0�H=��)��tq�X��!����m�u�1�K�T�i��� KyCp㻂���3�N#�l��b�N#iٜ���:ѕ�=�u���C��F�<���.��j�n����Np�m��*I�_M<tJ.�S]��9||�����j���XCC�g�w�0��c}�.`�k*좱>�v)�}B[�.N-J,��q@@{��p����ϗ��XA���V[c�:��K\��a(����u�=�c����飡�_�}�������P�KEi�e�,���Qqn�T\�L�P̿��`��U����}�F�p�vS�"��΀�j˗K;�m���E�����q�\�L���p<TM���	1��q�~DZq~��?#�!I� ]["���O��3
�a8Te��N'�t�
#(��<�UZ%HV�8�o��8���� Ԟ:T��,U�Έ��|������gl^�u���3��tS��y�r&T��gʆ*��ϝ�2 ��4#��~_u�,���%d���EV��\��,w/a1�u��\��k���RWgF�k#0.6��&���"ю�� ��:3;����
VD��ʩ���X� 3Va��j/��*ᛎ�E��ȩ��A��[��vT����'�.����q	���f|?�HO����|��>>C(���<�u��G|j7t�ff��z��w(e�66[��="�Z�	'
Eh~w���������4G��>g�^z�=��+I�r����MP4Ǌ_���m@�՛5B��������ܢg��a914d*��.xip��ª,��rnz�>[6�(�[�����~FR��@�3a�9�E��$	-&�Y�mt�#��u,6C��ϻ-�Ă�ϗ
8�4(��)O	{j�\d*K��0I�����Ov݀���8AF�U/�`�e���
\�X�c�ƃ@�Yh�v]�jG��|넮,�f�E�4haoNش��|5�_���� �6Par���9>c���'D�F���%�Zw
je'�G21覯�1���+x�dS,�S�G�P<EV��������o��g��{ ��J��7l_��G��w�sǔ~������4�jh�?F��O:D2�+&6YZd.��!A��SR�U{�e�Bsd�c�|c5�1�LϤ�5.�'�"�/]�R���>ԗ����ձD��{$Vg�[�G�,��r �˙Z(Xdg(�I�]�Պn�+�J&G���}�Eء��rE!���ʔ�
l�O�/y�*�-�^W�+C^�ҕ�]��H���}��?vP��o:���8#ß�ȴ���n��ҍPv��;HV��W�3���S�-l��S�O �0 ;@}�6s�pl*%/�$.L���s��A)RJIJj��mpÙ�tB���kEL���O�^pz���I���ʱf� &g���g��N�>j >aԼ.���u,.�l�+�
���L�C�P�e�f��@��`aP��a?=?7���������%a�զ�B�Gi-���IE�B�����>G�=}���oO�>����ѯ�_����/�a%p���! ��@� ���o���\�)��R�.����y'�-�Iz1Cײ�l=�%k���R{��k#/X���4�AF��/[vIR��Ѓ!�w�×##�����M��E�`t�
5��Z��@g~���T��/��i�%���6���fd��ξ���a	Ѳ�}k(�tg(ZR�/�'%˦�v����S��Ѷ��Y�@B��.�RĪv#���+J?��@P8g��E}��n8و�9��ӆ6��
D�w�ޟb7��K��Zz�I��H��d�v�bk�n�s�����	-�X�D�j+l;RJ"��j��N�b�SiV0X�oѫ��%�G�=�r/�>��i��w^� �M��M��^���Y:��Y�Y.������8�#'{K�}Z�0)j�X�߲�I�,MA��"]b��nĽ_��
m�4LP׿PI51�Z�/H�&[8ߠ�Ԛh/
T mb�Cb���rW�C�(Zʋq	�P^��� �%���Bb%���P,�p��q�}�
{��,nb"�#�� <u�p��;�ť�1��������0Ef�8��)���\�9�䵒�e�p�0��.a#D�>�o��f��[x�uO��U:K�G�B����e=��02X��X���{q�nks�m���c�����'\ex� ��V�|� ���r�W�zꪶ�u9����]��y7��֖��Y)
UKqkh1+1W��Yc/vzv6Ԕ�mq (#���+y;�+�{;�q�vI�:h��"S9a�"��oz�����Dm� �`J��$%�f3�!cTO.�]�t�P�^\�K<���Z�(����,�n��z��Ʋ�R������I;�uj
��,��� ��ۙzQf�(��D�1(����ʩ��B�_���D�V�����ā�kT�Sۊ��;`�k�0�;��c0Q�T�d�,�r�4LE�L����?�xߵ�	Ƈ�E�����	�~�ɋ��>�L���)���XgL:��'�sb�t�X��-�q�gW�kͯ�l���l&q�zq�rt��e�|�3���3�Kz=�Őq��*��$P�ߵ>z����v��5�Iu�{�87�S��&w��V26� &���H9�+fI��,����Q���G���L>�X����%� �l�g
`��z�@��0X�//5�ч;d���[���HOq���$��n/��	��&Ӏ�N��ߚ�T�CG��v�R�#��h �V���^�^b !]I�Ņ�Z�Q��!a+\o,�]���x�;���Kq���2�3	�s����,�y?fF4D|/$.�Ys�LVHuf�$,�A�xn&���w3���8O��ҥ�����X�V��뵭��^���,E�Kա�b�+��u�N\��^�XKqΛ�%��/�a��O��(��$0�q���8��$�)2��E<��������jzh�����ݿTmP^{�Ϯ��[�g���� �Z���6~ʝ�8��,��=�9v�������g\b���̏���ze����D��f!�$e"M�Q�� �D��y,,����qFe���/�CF��
Lދ���A�^��DF�A�f�s������Wa\f����?	�����1$�[���L�� ٵ��ǖ�ex�B���Ó�����m�\� ���r�k)O0hH�3�E����wa�DR3�y�
fb�(4/-�gD _N%�[G����@����4�>��_�A���^=�L8D]�q± �	��ԅ����8�i�U���!.��ף�6to�f"a��Ur�H���25�n�.1f�R*b�"��*�����#�Ge������Z䥑)J���~~��Hᐗ��U��j��G�q"7Cy���?�!w�1g��h�P(�s������7*'І�|-S<�ҽy-����IVp���y�+�120���N^��G�#�?��P�牪m�2x��dbW1cP"����w9���}Nf���X��V�Y'��}�<5%�j޽{0U|=d��c=ev������6FTBD���ʢ_�e�\S�y
d[�d<��,M���#-o�a.��&	������'�FM�/�	Ӓd�X��s~ �  ^L������%��͊�I�M���*�<����'P����An�l��sb��w@O�DE������O�y����߿}����z��������f޳�0�d�*ez�v�U<�	֥	Z:�a՜pHWOߤ���9M>_��V��|�f	�H*1�|s������
��M���Y�ɛ�<GH�?���������6�-G��,�e+�2q�k��X�]=�z���<5��+���8��\���Y~`��y�n:�Q�@�ߘE*G�9�g��z���`��Ʈ�,"�~�.�kG)�e��D
�Ǌ�*�N�W���p	���֖�G���o�i��NP�J��6=u��y��=�7�U�Ir�Ԉ��X O����!?V�8'�	X}���[� cY7�M)�p����2�q5p}�ܥ�23����'7`Ӎ�nӫM�?�\�(cZ�bx��_��c����>3�J�����V&�I>?��*�����S�9�fqn�����W��/�k�/|3����Ǌb���'����+H���}��0bX���d�&�'��-���k��S{�#�E��y遼��n�����q��vؠx�46�f��_�QƜ��d͎�c��zff1� ����O�-+������*mI;��P�s����=PL�j�
��	GK.�q�ٚ,�z ���w|ww�?�>�      �   �  x�}XmS�:�,�
3}R cɖl+
%�R�t�iGI��8�s�rC��#�	pf������ٳ�Rr'�:�ڗ���+9�8�IT�d&�R�p�������q���2���B��ϻ����C��"��k���e޵�[ĥ�GvD���Q�O���yA�'�ɗi��Y��dR� ���:�K2��B&�D]ڞ7����_��[�qȝ0��ax��w��H�\,����%CYE��J��@N�B�@OS}m;��\F�0�N���y�J�*�?/��=�N opv�������<�=�F�"J�^��5Q���0R����V��ݳ�}'g��>��
Z�]=���L�.��s����/�]����"��D�`�j[*�,m�&���%�97qZm̤ ��L
B�9��!z��V�^`	U�4���Rڃ��٧q��§�l)LSX�x�]�cp���uVE�ݓ��^��:\44pi�#o���}�]Y>�N2��4��pn�m��|��Pq�He�
�C���a :�����ݟ�ǻ+0y��Ԫ�\��a9�u�kG����Ľ&�e�I{(Q���Ct��9�=�~���D�L���VH��q4�/�y��I�P�y���6��m֤��i^�/��g��wC/D�;��%K��y�2�v�+j�2_�����/�:�R z���ًcɩ���!D������l��5�(]��	|0ʓ��)C�{�`Y{"�ݠ$�q��6�9*~��
�w9�}��W=G|:�,��u���Ē���TV�P�T�Ru߆��|�gX������C����8��ηo�<�O������W:;���A�K}����fKy4�#h�,�X���\�H�� 0��e�퐜��<^>&�-��(��i�Rr��M[�b���x�4
4�������*ã�c(��ʽ�<�>����+(���*�6��<!�9�����*�˄Vc���]t	���r·	/,*��,��f1��I���?V�h�,��Q���f��5S7.�Ș)�Q�����R0.\��~��'���t;��O��Q:�Ӝ��y�c+�ƛnH��sѵ1u�k�ML�<�7ظE�]�7n��s�!�7;μ�yܑ����.29��q5�E�֖��A8=��l��J����@����ِȾA匸n�Sa�z�B+�����^G��X]?��w���M9�6��>��#26�1c�_`c>>���fF��|��1(���o��q�5�h�jB��}�O����[�9Da�b�)'�27�x�� ��M�n��Q�"�Bqc#cU��G��Y��o�R������Z�����5Kr��4�3Gq11ٚ=^��!>J��E�#�8�M*U��尵�1�*%w :��4a�6*P�����~Xcd����9 �XO4�R�`*ay$��K�&Qc .Ծ�j��ۧ ;K1F��ha�H�q���F膡R����?���O�� S]&���"h��9>��L��P��T�T����Y0���+��t��l��]����7��a�sh1��e�P��B�*͉����E!��~����{��JwD�ZP<�bCw��ja� ܝ�O_�/|=�/�$o���g \���F
'�,��GC��Lq��v	t�.Q��Z�
��sv�W�8Z`����u=Y�	nh?��,��n}�I�D'�q�WuY�#��v,�=a]䲠����[�xWu~��b>�E#��D���@F�P�^����؄�/�*qUgc��A���h�@�(�uR���ǫ��P�����P��e�!8�,f"�ba��i<�!�k��4���Z��s�?Cl9U���95^m�I��0LR\��I�{�������X���=|;��؝`kC��+\�U��+�Q�B�k���M-8�&mj$��%r�&ޏ��ή�:kv�u|�zZ74�\��Y��E�E�/�f�;T3T��.b��g��u>�
��jZ�e���a���{�O9�|-����X���0}�/,�SjNsi�l���hk����&�EJ��}�r��s���X��-��c�@m�2���s�����
��ҾD��������<eA��ƻ�e4h��k��"=9�6W��f�=�Gq4W��D�^�c��&B{ط���H�&���m<�9.5x��`-���R,)WxqAY���+�b��X�_`��3�|�w tb|SU	��.%^��v9��1!4 �lz�5Zi�_ײ�����      �   �  x��YiS�ʶ���J�p
_��I��7����BR�H����m�����w�`c�{_UBONzyk��0b���ޔ��]?#�����W���_��������jD�Nc�X�)��h�_�����WS�'fd�j;f\l�Gf`&3����#�[�6O��j��t[iE%o��t�����F?⤜W#S2E�܄�f�0eN��zgn�U�m�<^�Y���lK�"u�͸���=ZO�gt_gfb,��ac��DK������<?9X�� S��0۞���z�-榜�\n������T"1�D���]��|��F���ffa	o2�U*,͔��A>�Ξy<R�$��۝��mri�ap�7q�^��`%����	�ǣ��n�M3�f�ԙT���#��I�f��9��]����%�4�b�9�#���.�w��t�T���4V�����x2����eރ�rIw?����:�R�37��c;��.(�vV+�{a+᠜���|�*߰Q���{(2�<�-�4M�cr~5x:���#EF��Y�X?S�����ImW���F�RS�� ���la��0���8���:%3d�oN���Ǐ�&�����ۑ|3�A��r�O~��g�*ވ�Fx��{��PBS�Aq�5x�oq������?���̤k�<M;��zf�U1����z�t,I<*Υw`3og�l�Nz#�FTB))�/��9�?�~�(��1rbGr`�s�׷�W��%�)a4�R��;5e��{��w8R�O�Ф���?���Sƴ�-`�r8}2�9�����k����dLn1�}3�7�""8�t���BP�)��B{c~wx*�k:b�ܙY�*M_��aF.r8Gc�~3��sP��Ya:u��s>IWP ���(`T��Zg������DL�q=+xB.0����vo��/|���d���3��d�7r�r)x.W)E�X�Q����:\��$��P�S;���k|^���b�ǷW�1^�D/��E�������)Jy��2Kpk-�]_�A�0��3/f���"�ȁ'�by��"�ْ�-��J|yk�(�'u�a���Q��~���ZьX�o>��5l�f�{=,�p4�<�-c��-����`��P���g+^Q"fI2W����]�n�#��؄4e���&�HN�b�V��CB�t�d!_�j��Y������,y���#���n�d;*BN�-�w��LG��g�`�\��Ě ��^0\ �U ��3 (�Ka+Mc��q�S�*b=v�³�& u�$���7X)��H`�@�yϱgp���t��	:�>��A����i7�f�a�Gz6�H�@G�n���2��B�`mcU�	�)����:]pKP>�n���n��`�{����Q��f͆�\���eR���Ϫ����z[�jXmBw�76e���Y	H��V�m*��j�d�nKJS,PJ҆�oߵ#|lT�u�������jh�ˣ�_��Q*]�Ͷ��|�6�nn�͸eF�b��`�G�n+�8e�)�JrF3� �yk�����\D ~�!p�-��~FΪG����r��
�0F:ęP"��aQ[��ǧ��L q��VM�xJe�(�2	��T�����Y7����#�7Z�G��������,j�[i&��h�O�r�#�Z�8/a���
���N���/\)�i\�3�9�(���h����˯��~�gd�gy�G&��$��6�f>ߏ\e>�^QYh�aի\��8z#
Vʂ3%N��?��w?���ڻ���
�0@/ �p�ݜ��k�1��Եw��I1�Qe���w,s��g�MҼ���7��Хq�8������g����k��
~ewbP;~�)�Vt��jy��+���4�4��U�����S+���e�.��sF$Z�>�:W(�Ziqt����ߓ�Z��dz� {��gj���9��8���j���~]'ҥM��V�UT9��� � v �Rb����h�1<z��U�32����pr�&��]k�O���
>�H��Cv�P���w�-a��>���/�R��F2�z�	4��>�ssw�!��z��jP����B�N
�r��5����l&�� �&��w�`��;bəM���Z�l*��)�a!am�a���+�yv9;^�C�5��@w�n�4�Y����~��2۪��^����� >\�����@�^LD��i��,����*�C���e�5>9�'���Ծ5\���2�1B:��6ES�4?�6��+[|�Ǉ_B7��ނ((��{������������}�ݳ�5\ӎ�G=DM(MQ�����6���PN�n5 	�NAj�K]��|>��+�S�W��ZS�s�������_:��Dn�Ļn�l����o?���m<D[:}��[��A��#D*կ��i���.�DB�VL�����g˚N�+�ց*�YBy���>_�>˲��7a1�^�V���m<v����$)�泹��W_������4h�ؖP̛�2�K�}(T��\l��-�Tl2M�|��+zw�=˿'�PPb��
�ԑ���ީ���ȭ^�*�XP��V$��zl���ׇW�e����=�S3����a�;��C$ܳ��[���S��{5�8��?!"�c�ז�,hy�^~+��	��A����N�Ti-MU���O��_��~G"C�mS�7�5Fp��d�/�^Y=�9E�
Fk�x�Q��f��w{Ӡ�7i�gTi��I���NW';���N��u�@�������)
o���{Ђ������E����tۃ|��ߴcY 087��{�ݾ�}�*"��]1C�A�}v��V�,�?�:��8Ag&�_���]P��l����Bk����\�_B\�$�]z;U2��K,��\[��M�cpx:��\�y$�!�5l�����r�F�&�H*j�wQMDV��M�E�XX�R��M��
<E�{r<��m��{���~rC#�`���mcQ\��i����7�A��Y�c(�,�C�oC%㧳����*�bHg��BC=r#۝����Eh�=j0cd׎�E�m/k��q#5I�rfw	��Q��`�>��ܷ'٧Q�4�	�{Q�4��c+t����� "�B���3H���Sj�o�9E��~]�a�u�7���t�� P��h_�����x�Jބ��LZ��D�U&��=�-�p�kŬfh�����O_�H*�a8_1,����[/��&2��/`|���Ƨ٩�}�M {	jC� )ɘ���{go��4�ھ����ǅ��OUٳ��Zu����}�S�mAї�kU�z�u���z�E�嘔������W7Y$3�GF��s�L���T��/�?`�P����c�� Ť��(a��p[}9;���ɣ��J�ܦ��-s8鿛��JK��ۗ�g���z�>W
�`Jn����W�}5���ێ���3�DN     