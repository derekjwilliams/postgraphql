select
  __people__."username"::text as "0",
  array(
    select array[
      __single_table_items_2."type"::text,
      __single_table_items__."type"::text,
      __single_table_items__."id"::text,
      __people_2."username"::text,
      __single_table_items__."author_id"::text,
      __single_table_items__."position"::text,
      __single_table_items__."created_at"::text,
      __single_table_items__."updated_at"::text,
      __single_table_items__."is_explicitly_archived"::text,
      __single_table_items__."archived_at"::text,
      __single_table_items__."title"::text,
      __single_table_items__."description"::text,
      __single_table_items__."note"::text,
      __single_table_items__."color"::text,
      __people_3."username"::text,
      __people_4."username"::text,
      __people_5."username"::text,
      __people_6."username"::text,
      __single_table_items_2."parent_id"::text,
      __single_table_items_2."id"::text,
      __people_7."username"::text,
      __single_table_items_2."author_id"::text,
      __single_table_items_2."position"::text,
      __single_table_items_2."created_at"::text,
      __single_table_items_2."updated_at"::text,
      __single_table_items_2."is_explicitly_archived"::text,
      __single_table_items_2."archived_at"::text,
      __single_table_items_2."title"::text,
      __single_table_items_2."description"::text,
      __single_table_items_2."note"::text,
      __single_table_items_2."color"::text
    ]::text[]
    from interfaces_and_unions.single_table_items as __single_table_items_2
    left outer join interfaces_and_unions.single_table_items as __single_table_items__
    on (__single_table_items_2."parent_id"::"int4" = __single_table_items__."id")
    left outer join interfaces_and_unions.people as __people_2
    on (__single_table_items__."author_id"::"int4" = __people_2."person_id")
    left outer join interfaces_and_unions.people as __people_3
    on (__single_table_items__."author_id"::"int4" = __people_3."person_id")
    left outer join interfaces_and_unions.people as __people_4
    on (__single_table_items__."author_id"::"int4" = __people_4."person_id")
    left outer join interfaces_and_unions.people as __people_5
    on (__single_table_items__."author_id"::"int4" = __people_5."person_id")
    left outer join interfaces_and_unions.people as __people_6
    on (__single_table_items__."author_id"::"int4" = __people_6."person_id")
    left outer join interfaces_and_unions.people as __people_7
    on (__single_table_items_2."author_id"::"int4" = __people_7."person_id")
    where
      (
        __people__."person_id"::"int4" = __single_table_items_2."author_id"
      ) and (
        true /* authorization checks */
      )
    order by __single_table_items_2."id" asc
  ) as "1",
  __people__."person_id"::text as "2"
from interfaces_and_unions.people as __people__
where (
  true /* authorization checks */
)
order by __people__."person_id" asc