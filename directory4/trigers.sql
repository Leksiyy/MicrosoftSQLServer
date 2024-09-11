create trigger trg_updateicecreamstock
    on IstoriyaZamovlennya
    after insert
    as
begin
    update IceCream
    set StockQuantity = StockQuantity - i.Quantity
    from inserted i
    where IceCream.ID = i.MorozivoID;

    if exists (select 1 from IceCream where StockQuantity < 0)
        begin
            rollback transaction;
        end
end;

create trigger trg_calculatetotalcost
    on IstoriyaZamovlennya
    after insert, update
    as
begin
    update Orders
    set TotalCost = (
        select sum(i.Price * iz.Quantity)
        from IstoriyaZamovlennya iz
                 join IceCream i on iz.MorozivoID = i.ID
        where iz.OrderID = Orders.ID
    )
    where Orders.ID in (
        select distinct OrderID from inserted
    );
end;

create trigger trg_logneworder
    on Orders
    after insert
    as
begin
    insert into OrderLogs (OrderID, OrderDate, TotalCost)
    select ID, OrderDate, TotalCost
    from inserted;
end;
